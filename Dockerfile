FROM ubuntu:latest

# Install pre-req packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y unzip curl libaio1 libdbi-perl build-essential postgresql-client

# Download oracle client packages
RUN curl --silent -o /tmp/instantclient-basic-linux.x64-21.3.0.0.0.zip https://download.oracle.com/otn_software/linux/instantclient/213000/instantclient-basic-linux.x64-21.3.0.0.0.zip
RUN curl --silent -o /tmp/instantclient-sqlplus-linux.x64-21.3.0.0.0.zip https://download.oracle.com/otn_software/linux/instantclient/213000/instantclient-sqlplus-linux.x64-21.3.0.0.0.zip
RUN curl --silent -o /tmp/instantclient-sdk-linux.x64-21.3.0.0.0.zip https://download.oracle.com/otn_software/linux/instantclient/213000/instantclient-sdk-linux.x64-21.3.0.0.0.zip


#Setup oracle client
RUN mkdir -p /oracle/product && \
    unzip "/tmp/instantclient-*.zip" -d /oracle/product && \
    rm -f /tmp/instantclient-*.zip

ENV ORACLE_HOME=/oracle/product/instantclient_21_3
ENV LD_LIBRARY_PATH=${ORACLE_HOME}
ENV PATH=$ORACLE_HOME:${PATH}

# Install ora2pg
RUN curl -L -o /tmp/ora2pg.zip https://github.com/darold/ora2pg/archive/refs/tags/v22.1.zip &&\
    (cd /tmp && unzip ora2pg.zip && rm -f ora2pg.zip) &&\
    mv /tmp/ora2pg* /tmp/ora2pg &&\
    (cd /tmp/ora2pg && perl Makefile.PL && make && make install)
