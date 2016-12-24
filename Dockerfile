FROM centos:latest

MAINTAINER HKLCF <hklcfs@gmail.com>

RUN yum update -y && yum upgrade -y && yum install -y \
  openssh-server \
  && rm -rf /var/cache/yum/*

RUN echo 'root:password' | chpasswd

RUN mkdir /var/run/sshd

RUN sed 's/PermitRootLogin without-password/PermitRootLogin yes/' -i /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
