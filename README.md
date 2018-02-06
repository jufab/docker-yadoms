[![Build Status](https://travis-ci.org/jufab/docker-yadoms.svg?branch=master)](https://travis-ci.org/jufab/docker-yadoms)


# docker-yadoms

Image docker for [Yadoms](http://www.yadoms.com/)

```console
docker run --name yadoms -d -p 8080:8080 yadoms
```

## Developer Mode

```console
docker run --name yadoms -d -p 8080:8080 -e DEVELOPER_MODE=true yadoms
```
