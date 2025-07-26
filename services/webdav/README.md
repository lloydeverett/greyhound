
## Setup directories

```bash
mkdir ./rw/client_temp
mkdir ./rw/data
chmod -R u=rwX,g=rwX,o=rwX ./rw/data
```

## Authentication

Create an htpasswd file as follows:

htpasswd -bc ./htpasswd username password

