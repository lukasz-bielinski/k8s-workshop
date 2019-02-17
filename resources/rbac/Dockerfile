FROM ubuntu:18.04


RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y apt-transport-https curl wget tar gnupg2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists


RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg |  apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" |  tee -a /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    apt-get install -y kubectl  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists
