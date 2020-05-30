kind = "ingress-gateway"
name = "ingress-gateway"

listeners = [
  {
    port = 5001
    protocol = "tcp"
    services = [
      {
        name = "consul"
      }
    ]
  }
]
