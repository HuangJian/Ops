## 端口流量转发

```bash
cat > /etc/nginx/nginx-forward.conf <<EOF

user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

include /usr/share/nginx/modules/*.conf;

events {
    worker_connections 1024;
}

stream {
    server {
        listen <local-port>;
        proxy_pass <remote-ip>:<remote-port>;
    }
}
EOF
```

```bash
docker run --name nginx-forward \
  --restart=always \
  -v /etc/nginx/nginx-forward.conf:/etc/nginx/nginx.conf:ro \
  -p 8103:443/tcp \
  -p 8103:443/udp \
  -d nginx
```
