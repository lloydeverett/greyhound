
# Greyhound

## Setup

Instructions are given for Debian-based distributions. Other distros are left as an exercise for the reader.

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
cd /etc/caddy
ln -s /PATH/TO/GREYHOUND/greyhound/entrypoint/Caddyfile Caddyfile
cd /opt
ln -s /PATH/TO/GREYHOUND/greyhound greyhound
```

