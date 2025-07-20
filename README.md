
# Greyhound

## Setup

Instructions are given for Debian-based distributions. Other distros are left as an exercise for the reader.

### Clone repository

```bash
git clone https://github.com/lloydeverett/greyhound
```

### Install Caddy

```bash
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https curl
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
chmod o+r /usr/share/keyrings/caddy-stable-archive-keyring.gpg
chmod o+r /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy
```

### Create symlinks

```bash
cp /etc/caddy/Caddyfile ~/Caddyfile.bak
sudo rm /etc/caddy/Caddyfile
sudo ln -s $(realpath ./entrypoint/Caddyfile) /etc/caddy/Caddyfile
sudo ln -s $(realpath .) /opt/greyhound
```

### Caddy configuration

Edit `entrypoint/Caddyfile` to your liking.

