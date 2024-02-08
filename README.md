# Slynite Maintenance

This repository contains the static maintenance page for Slynite servers.

```shell
docker build -t maintenance .
docker run -d -p 80:80 --name maintenance maintenance
```