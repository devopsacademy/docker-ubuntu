FROM       ubuntu:18.04
MAINTAINER Mauricio Araya

ENV LANGUAGE=en_US
ENV LANG=en_US.UTF-8

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y locales \
                       openssh-client \
                       apt-transport-https \
                       bash-completion \
                       wget \
                       vim \
                       curl \
                       gnupg2 \
                       grc \
                       netcat \
                       iputils-ping \
                       git \
                       net-tools \
                       jq

RUN ln -s /usr/games/cowsay /usr/local/bin/cowsay && \
    ln -s /usr/games/cowthink /usr/local/bin/cowthink

RUN apt-get install -y libxml2 zlib1g-dev \
                      build-essential \
                      ruby-full \
                      python3 \
                      python3-pip

RUN pip3 install --upgrade --force-reinstall pip setuptools jmespath-terminal requests && \
    if [ ! -e /usr/bin/python ]; then ln -sf /usr/bin/python3 /usr/bin/python; fi

RUN locale-gen en_US && locale-gen en_US.UTF-8 && update-locale

RUN apt-get clean -y && rm -rf /root/.cache
