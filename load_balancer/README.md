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

## 1-install_load_balancer

Installs and configures HAproxy on a brand new Ubuntu machine to balance HTTP
traffic between `web-01` and `web-02` using the roundrobin algorithm.

### Usage

```bash
sudo ./1-install_load_balancer
```

### What it does

1. Updates the package list and installs HAproxy.
2. Writes an HAproxy configuration with:
   - a frontend listening on port 80,
   - a backend using `balance roundrobin`,
   - health checks for both web servers.
3. Validates the configuration with `haproxy -c`.
4. Enables HAproxy on boot and restarts it through the init/service manager.

### Verification

```bash
curl -sI http://<lb-ip> | grep X-Served-By
```

Repeating the request should alternate between the web servers:

```text
X-Served-By: 7355-web-01
X-Served-By: 7355-web-02
```
```
