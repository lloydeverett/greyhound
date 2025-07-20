
# Greyhound

## Setup

Instructions are given for Debian-based distributions. Other distros are left as an exercise for the reader.

### Requirements

#### Podman

Setup rootless Podman [as described in this guide](https://github.com/containers/podman/blob/main/docs/tutorials/rootless_tutorial.md).

### `podman-compose`

The `podman-compose` provided in apt repositories can be quite old. You can install the tool manually as follows:

```bash
sudo curl -o /usr/local/bin/podman-compose https://raw.githubusercontent.com/containers/podman-compose/main/podman_compose.py
sudo chmod +x /usr/local/bin/podman-compose
```

Also ensure that `podman compose` makes use of this tool rather than `docker-compose` which is the default.

#### Caddy

```bash
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https curl
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
chmod o+r /usr/share/keyrings/caddy-stable-archive-keyring.gpg
chmod o+r /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy
```

### Clone repository

```bash
cd ~
git clone https://github.com/lloydeverett/greyhound
```

### Create symlinks

```bash
cp /etc/caddy/Caddyfile ~/Caddyfile.bak
sudo rm /etc/caddy/Caddyfile
sudo ln -s $(realpath ./entrypoint/Caddyfile) /etc/caddy/Caddyfile
sudo ln -s $(realpath .) /opt/greyhound
```

### Systemd services

First, allow `podman-compose` to create systemd service definitions via `podman-compose systemd -a create-unit`. Now you should be able to hop into one of the directories under `service` and create a systemd service via `podman-compose systemd -a register`, e.g.

```
cd services/hello-world
podman-compose systemd -a register
```

### Caddy configuration

Edit `entrypoint/Caddyfile` to your liking. Then

```bash
sudo systemctl enable caddy
sudo systemctl start caddy
```

