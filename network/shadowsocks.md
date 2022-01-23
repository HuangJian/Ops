https://hub.docker.com/r/teddysun/shadowsocks-libev

### write a config file
```bash 
cat > /etc/shadowsocks-libev/config.json <<EOF
{
    "server":"0.0.0.0",
    "server_port":9000,
    "password":"password0",
    "timeout":300,
    "method":"aes-256-gcm",
    "fast_open":false,
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp"
}
EOF
```

> https://pincong.rocks/article/12173
> 
> 目前xchacha20-ietf-poly1305和aes-256-gcm是最佳的选择，由于各大平台的cpu现在对aes算法都有较好的优化，我个人推荐aes-256-gcm

### run shadowsocks in docker
```bash 
docker run -d \
  --restart=always \
  -p 8000:9000 \
  -p 8000:9000/udp \
  --name ss-libev \
  -v /etc/shadowsocks-libev:/etc/shadowsocks-libev \
  teddysun/shadowsocks-libev
```
