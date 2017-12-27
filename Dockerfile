FROM ubuntu:bionic
MAINTAINER jufab "https://github.com/jufab"
LABEL authors=jufab

ARG YADOMS_VERSION="2.0.1"

RUN apt -qqy update \
  && apt -qqy install \
    sudo \
    wget \
  && apt -qyy autoremove \
  && rm -rf /var/lib/apt/lists/* \
  && apt -qyy clean


#========================================
# Add normal user with passwordless sudo
#========================================
RUN useradd yadoms \
         --shell /bin/bash  \
         --create-home \
  && usermod -a -G sudo yadoms \
  && gpasswd -a yadoms yadoms \
  && echo 'yadoms:yadoms' | chpasswd \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers

WORKDIR /home/yadoms
ADD start.sh /home/yadoms/
RUN chmod +x start.sh
USER yadoms
RUN wget https://github.com/Yadoms/yadoms/releases/download/${YADOMS_VERSION}/Yadoms-${YADOMS_VERSION}-Linux.tar.gz \
  && tar xzvf Yadoms-${YADOMS_VERSION}-Linux.tar.gz \
  && mv Yadoms-${YADOMS_VERSION}-Linux Yadoms/ \
  && rm Yadoms-${YADOMS_VERSION}-Linux.tar.gz

CMD ["/home/yadoms/start.sh"]

EXPOSE 8080