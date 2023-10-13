FROM nvidia/cuda:11.3.1-base-ubuntu20.04
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /content

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y sudo && apt-get install -y python3-pip && pip3 install --upgrade pip
RUN apt-get install -y curl tzdata aria2 gnupg wget htop sudo git git-lfs software-properties-common build-essential libgl1 zip unzip

# Config timezone
RUN  date -R && sudo ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && date -R

ENV PATH="/home/admin/.local/bin:${PATH}"
ENV ALIST_TAR="AI-Vtuber.git"
# # Alist
# RUN wget https://github.com/Ikaros-521/AI-Vtuber.git
RUN git clone https://github.com/Ikaros-521/AI-Vtuber.git

