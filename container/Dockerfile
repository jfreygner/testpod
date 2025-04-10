FROM registry.access.redhat.com/ubi9/ubi

ADD loop.sh /usr/local/sbin

RUN yum -y --nodocs update && \
    yum -y --nodocs install iperf3 iputils iproute bind-utils rsync procps openssh-clients && \
    yum clean all && \
    mkdir /data && \
    chmod g=u /data && \
    chmod +x /usr/local/sbin/loop.sh

VOLUME /data

STOPSIGNAL SIGKILL

CMD ["/usr/local/sbin/loop.sh"]
