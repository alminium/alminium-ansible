FROM centos:7

MAINTAINER Takashi Okamoto

RUN yum install -y epel-release
RUN yum install -y git ansible
RUN git clone https://github.com/alminium/alminium-ansible
WORKDIR alminium-ansible
COPY site.yml site.yml
COPY hosts  hosts
COPY group_vars/all group_vars/all
RUN ansible-playbook site.yml -i hosts
WORKDIR /
RUN rm -fr alminium-ansible
COPY supervisord.conf /etc/supervisord.conf
RUN chmod u+w /etc/sudoers
RUN sed -i 's/Defaults    requiretty/#Defaults    requiretty/' /etc/sudoers
RUN chmod u-w /etc/sudoers

EXPOSE 443

CMD /usr/bin/supervisord