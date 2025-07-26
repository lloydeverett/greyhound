FROM debian:bullseye-slim

ENV NGINX_VERSION=1.29.0
ENV NGINX_DAV_EXT_VERSION=3.0.0

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
    build-essential \
    libpcre3-dev \
    zlib1g-dev \
    libssl-dev \
    libxslt1-dev \
    libxml2-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# Download and extract NGINX source
RUN curl -fsSL http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz | tar -xz

# Clone WebDAV extras module
RUN git clone --branch v${NGINX_DAV_EXT_VERSION} https://github.com/arut/nginx-dav-ext-module.git

# Build and install NGINX with WebDAV extras module
RUN cd nginx-${NGINX_VERSION} \
    && ./configure \
        --prefix=/etc/nginx \
        --sbin-path=/usr/sbin/nginx \
        --conf-path=/etc/nginx/nginx.conf \
        --error-log-path=/var/log/nginx/error.log \
        --http-log-path=/var/log/nginx/access.log \
        --with-http_ssl_module \
        --with-http_dav_module \
        --add-module=../nginx-dav-ext-module \
    && make \
    && make install

# Clean up build stuff
RUN rm -rf /nginx-${NGINX_VERSION} /nginx-dav-ext-module

# Setup config and runtime dirs
RUN mkdir -p /var/log/nginx /var/cache/nginx /etc/nginx/conf.d

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

