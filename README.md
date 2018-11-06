# Caddy Docker Image

A Docker image for [Caddy](https://caddyserver.com/).

## What is Caddy?

> The HTTP/2 web server with automatic HTTPS

 [caddyserver.com/](https://caddyserver.com/)

## How to use this image

### Standard usage

Run this container with the following command:

```console 
$ docker run -d -p 2015:2015/tcp mvance/caddy:latest
```

Add-ons can be configured via the plugins build arg.

## Issues

If you have any problems with or questions about this image, please contact me through a [GitHub issue](https://github.com/MatthewVance/caddy-docker/issues).

## Contributing

You are invited to contribute fixes and/or updates.

## Acknowledgments

This Dockerfile was influenced by the [Alpine based Dockerfile for Caddy](https://github.com/abiosoft/caddy-docker) by [@abiosoft](https://github.com/abiosoft). The main difference is this one is based on Debian and does not include a PHP version. 

## License

Unless otherwise specified, all code is released under the MIT License (MIT). See the [repository's `LICENSE` file](https://github.com/MatthewVance/caddy-docker/blob/master/LICENSE) for details.
