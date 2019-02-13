FROM alpine:3.8

RUN apk update

RUN apk add curl \
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

RUN apk add zsh vim sed
COPY zshrc /root/.zshrc

RUN apk add bash git\
    && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf \
    && zsh -c "/root/.fzf/install"

ENTRYPOINT ["/bin/zsh"]
