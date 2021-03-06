FROM debian:stretch
MAINTAINER Emerson Matsumoto <japinha02@gmail.com>

# Install samba
RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update -qq && \
    apt-get install -qqy --no-install-recommends procps samba \
                $(apt-get -s dist-upgrade|awk '/^Inst.*ecurity/ {print $2}') && \
    mkdir -m 777 /shared && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*
COPY smb.conf /etc/samba/
COPY start.sh /start.sh

EXPOSE 137/udp 138/udp 139 445

RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]