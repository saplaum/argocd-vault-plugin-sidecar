FROM alpine:3.17

LABEL maintainer="plaum.s@gmail.com"

# Install some binaries 
RUN apk add curl helm aws-cli gpg git

# Install the argocd-vault-plugin (AVP) plugin 
ENV AVP_VERSION=1.13.1
ENV BIN=argocd-vault-plugin
RUN curl -L -o ${BIN} https://github.com/argoproj-labs/argocd-vault-plugin/releases/download/v${AVP_VERSION}/argocd-vault-plugin_${AVP_VERSION}_linux_amd64
RUN chmod +x ${BIN}
RUN mv ${BIN} /usr/local/bin