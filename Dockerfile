FROM rust:latest

ARG USERNAME=niels
SHELL ["/bin/bash", "-c"]
WORKDIR /home/$USERNAME/

RUN echo $USERNAME && \
    groupadd -r $USERNAME && \
    useradd -m --no-log-init -r -g $USERNAME $USERNAME && \
    chown -R $USERNAME /home/$USERNAME/ 

RUN apt update && \
    apt upgrade -y && \
    apt install -y  --no-install-recommends\
    build-essential \
    clang-format \
    cmake \
    git \
    neovim

USER $USERNAME

RUN git clone https://github.com/nm47/advent_of_code_2023.git
