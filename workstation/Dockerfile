FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      bash-completion ca-certificates curl file findutils grep iproute2 iputils-ping \
      less man-db manpages nano net-tools openssl procps rsyslog sudo tree util-linux vim wget \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash analyst \
    && echo 'analyst:cyberops' | chpasswd \
    && usermod -aG sudo analyst \
    && printf 'analyst ALL=(ALL) NOPASSWD:ALL\n' >/etc/sudoers.d/analyst \
    && chmod 440 /etc/sudoers.d/analyst

COPY start-lab.sh /usr/local/bin/start-lab.sh
COPY bin/journalctl /usr/local/bin/journalctl
COPY lab.support.files/ /opt/lab.support.files/
RUN chmod +x /usr/local/bin/start-lab.sh /usr/local/bin/journalctl

USER root
