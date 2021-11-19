FROM ubuntu:focal

RUN sed -i 's:^path-exclude=/usr/share/man:#path-exclude=/usr/share/man:' \
        /etc/dpkg/dpkg.cfg.d/excludes
RUN apt update && apt install -y software-properties-common \
    && apt-add-repository --yes --update ppa:ansible/ansible \
    && apt update && apt install -y \
    ansible \
    curl \
    fd-find \
    git \
    htop \
    httpie \
    iproute2 \
    iputils-ping \
    lsof \
    maven \
    man \
    manpages-posix \
    net-tools \
    netcat \
    openjdk-11-jdk \
    python3 \
    python3-pip \
    ripgrep \
    smbclient \
    sudo \
    strace \
    tig \
    unzip \
    wget \
    tcpdump \
    vim \
    zip \
    zsh \
    && rm -rf /var/lib/apt/lists/*
RUN yes | unminimize
RUN useradd -ms /bin/fish tools-docker && echo "tools-docker:tools-docker" | chpasswd && adduser tools-docker sudo

USER tools-docker
RUN curl -s "https://get.sdkman.io" | bash

WORKDIR /home/tools-docker

CMD tail -f /dev/null
