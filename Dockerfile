FROM registry.access.redhat.com/ubi8/ubi

ADD loop.sh /usr/local/sbin

RUN yum -y update && \
    yum -y install iputils iproute bind-utils rsync procps && \
    yum clean all && \
    mkdir /data && \
    chmod g=u /data && \
    chmod +x /usr/local/sbin/loop.sh

VOLUME /data

CMD ["/usr/local/sbin/loop.sh"]