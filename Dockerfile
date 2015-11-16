FROM nginx:latest

MAINTAINER Mihai Csaky <mihai.csaky@sysop-consulting.ro>


COPY config /

ENV CONFD_VERSION 0.10.0

ADD https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 /opt/confd/confd

RUN chmod +x /opt/confd/confd /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 80 443

CMD ["/opt/confd/confd"]
