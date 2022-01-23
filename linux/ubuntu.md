## [Docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script)

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sh ./get-docker.sh
```

### [Manage Docker as a non-root user](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user)
```bash
sudo groupadd docker
sudo usermod -aG docker $USER
```

### [Configure Docker to start on boot](https://docs.docker.com/engine/install/linux-postinstall/#configure-docker-to-start-on-boot)
```bash
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
```
