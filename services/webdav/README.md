
## Setup

### .env file

Create a .env file in the following format:

```bash
WEBDAV_USERNAME=username
WEBDAV_PASSWORD=password
PUID=199
PGID=199
```

Nginx will use the PUID/PGID combination above to access the data directory.

### Create data directory

Ensure that the PUID and PGID selected above have access to the data directory you create. For example:

```bash
mkdir data
sudo chown 199:199 data
```

