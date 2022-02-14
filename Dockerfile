FROM registry.access.redhat.com/ubi8/ubi

RUN yum -y update && \
    yum -y install iputils iproute bind-utils rsync procps && \
    yum clean all && \
    mkdir /data && \
    chmod g=u /data

VOLUME /data

ADD loop.sh /usr/local/sbin

CMD ["/usr/local/sbin/loop.sh"]