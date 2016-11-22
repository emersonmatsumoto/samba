FROM debian:stretch
MAINTAINER David Personette <dperson@gmail.com>

# Install samba
RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update -qq && \
    apt-get install -qqy --no-install-recommends procps samba \
                $(apt-get -s dist-upgrade|awk '/^Inst.*ecurity/ {print $2}') &&\
    mkdir /samba && \
    mkdir /samba/dev && \
    mv /etc/samba/smb.conf /etc/samba/smb.conf.bak 
    echo '[Dev]' >>/etc/samba/smb.conf && \
    echo 'path = /samba/dev' >>/etc/samba/smb.conf && \
    echo 'public = yes' >>/etc/samba/smb.conf && \
    echo 'writable = yes' >>/etc/samba/smb.conf && \
    echo '' >>/etc/samba/smb.conf && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

EXPOSE 137/udp 138/udp 139 445

ENTRYPOINT ["service samba start"]