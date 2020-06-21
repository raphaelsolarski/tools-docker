FROM ubuntu:eoan

RUN sed -i 's:^path-exclude=/usr/share/man:#path-exclude=/usr/share/man:' \
        /etc/dpkg/dpkg.cfg.d/excludes
RUN apt update && apt install -y software-properties-common \
    && add-apt-repository ppa:fish-shell/release-3 \
    && apt-add-repository --yes --update ppa:ansible/ansible \
    && apt update && apt install -y \
    ansible \
    bat \
    curl \
    fd-find \
    fish \
    git \
    httpie \
    iputils-ping \
    maven \
    man \
    manpages-posix
    net-tools \
    netcat \
    openjdk-11-jdk \
    python3 \
    python3-pip \
    ripgrep \
    sudo \
    strace \
    tig \
    vim \
    zsh \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/fish tools-docker
VOLUME /home/tools-docker

USER tools-docker
WORKDIR /home/tools-docker

CMD tail -f /dev/null
