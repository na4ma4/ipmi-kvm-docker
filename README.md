# ipmi-kvm-docker

## Usage

```shell
docker run --rm --platform linux/amd64 -p 8080:8080 -e "RES=1920x1080x24" ghcr.io/na4ma4/ipmi-kvm-docker:latest
```

then open [http://localhost:8080](http://localhost:8080) and it should work for old SuperMicro IPMI servers.
