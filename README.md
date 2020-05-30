# consul-ingress-gateway

[Consul Ingress Gateway][1] requires the `consul` binary and `envoy` to be in
the same container.

Set the `CONSUL_HTTP_ADDR` and `CONSUL_GRPC_ADDR` environment variables to
point the ingress gateway at your Consul agent.

A docker-compose.yaml file is included to verify that the Consul client can reach
the Consul server.

## Releasing

- Update the Consul version is set in the Makefile and the docker-compose.yaml file
- `make build` will generate a new image
- `make test` will run tests against the image
- `make release` will push the new image to Docker Hub

[1]: https://www.consul.io/docs/connect/ingress_gateway
