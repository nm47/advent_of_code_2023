FROM rust:latest

ARG USERNAME=niels
SHELL ["/bin/bash", "-c"]
RUN echo $USERNAME && \
    groupadd -r $USERNAME && \
    useradd -m --no-log-init -r -g $USERNAME $USERNAME && \
    chown -R $USERNAME /home/$USERNAME/advent_of_code_2023 && \
    apt update && \
    apt upgrade -y && \
    apt install -y \
    build-essential \
    clang-format \
    cmake \
    git \
    vim 

USER $USERNAME
WORKDIR /home/niels/advent_of_code_2023
RUN git clone repo=http://github.com/nm47/advent_of_code_2023
