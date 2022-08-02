FROM --platform=linux/amd64 alpine:3.10.9
LABEL maintainer "miaoyq <miaoyq.2017@gmail.com>"
COPY .bashrc /root/.bashrc

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk --no-cache --update --verbose add grep bash tcpdump iptables python curl  && \
    wget -O speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py && \
    chmod +x speedtest-cli && \
    mv ./speedtest-cli /bin/speedtest-cli && \
    rm -rf /var/cache/apk/* /tmp/* /sbin/halt /sbin/poweroff /sbin/reboot

ENTRYPOINT ["sleep infinity"]
