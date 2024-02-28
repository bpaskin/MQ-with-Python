FROM python:3.12.2-slim-bookworm

# Requires the MQ Client C Libraries from http://ibm.biz/mq93clients
ARG MQCLIENT_FILENAME=9.3.4.1-IBM-MQC-UbuntuLinuxX64.tar.gz
WORKDIR /tmp

RUN  apt-get update && apt-get upgrade -y \
  && apt-get install build-essential -y

COPY ${MQCLIENT_FILENAME} /tmp/

RUN tar -zxvf ${MQCLIENT_FILENAME} \
  && MQClient/mqlicense.sh -accept \
  && dpkg -i MQClient/ibmmq-runtime_*.deb \
  && dpkg -i MQClient/ibmmq-gskit_*.deb \ 
  && dpkg -i MQClient/ibmmq-client_*.deb \ 
  && dpkg -i MQClient/ibmmq-sdk_*.deb \
  && rm -Rf ${MQCLIENT_FILENAME} MQClient

RUN  echo "/opt/mqm/lib64" >> /etc/ld.so.conf.d/libc.conf  \
  && echo "/opt/mqm/lib" >> /etc/ld.so.conf.d/libc.conf \
  && ldconfig

RUN pip install pymqi

COPY sample.py /root

ENTRYPOINT python /root/sample.py

