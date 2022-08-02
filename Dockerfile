FROM --platform amd64 alpine:latest
LABEL maintainer "miaoyq <miaoyq.2017@gmail.com>"
COPY .bashrc /root/.bashrc

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk --no-cache --update --verbose add grep bash tcpdump iptables python curl  && \
    rm -rf /var/cache/apk/* /tmp/* /sbin/halt /sbin/poweroff /sbin/reboot

ENTRYPOINT ["sleep infinity"]
