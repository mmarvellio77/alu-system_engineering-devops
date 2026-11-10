# Load Balancer

This directory contains scripts for configuring the web servers that sit behind
the load balancer.

## 0-custom_http_response_header

Configures a brand new Ubuntu machine to install Nginx and add a custom
`X-Served-By` HTTP response header. The header value is the hostname of the
server running Nginx, which makes it possible to see which web server answered
a request.

### Usage

```bash
sudo ./0-custom_http_response_header
```

### What it does

1. Updates the package list and installs Nginx.
2. Adds `add_header X-Served-By "<hostname>";` to the default Nginx server
   block, only if it is not already present.
3. Validates the Nginx configuration with `nginx -t`.
4. Restarts Nginx.

### Verification

```bash
curl -sI <server-ip> | grep X-Served-By
```

Example output:

```text
X-Served-By: 7355-web-01
```
