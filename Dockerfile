FROM ubuntu:latest

RUN apt update
RUN apt install -y net-tools iputils-ping netcat
RUN apt install -y python3 python3-pip

