FROM vault:1.9.4
ARG KUBECTL_VERSION="stable"

# Add more dependencies
RUN apk add  --no-cache bash \
    && [ "${KUBECTL_VERSION}" = "stable" ] && KUBECTL_VERSION=$(wget -O - https://storage.googleapis.com/kubernetes-release/release/stable.txt) \
    && cd /usr/local/bin \
    && wget "https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
    && chmod +x /usr/local/bin/kubectl

USER vault
CMD bash