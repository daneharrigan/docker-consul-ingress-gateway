FROM envoyproxy/envoy-alpine:v1.14.1

LABEL maintainer=dane.harrigan@gmail.com

ARG CONSUL_VERSION

RUN apk add unzip curl && \
    curl -sLO https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip && \
    unzip consul_${CONSUL_VERSION}_linux_amd64.zip && \
    install consul /usr/bin/consul

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["consul connect envoy -register -gateway=ingress -service=ingress-gateway -admin-bind='127.0.0.1:9000' -address='{{ GetInterfaceIP \"eth0\" }}:8000'"]
