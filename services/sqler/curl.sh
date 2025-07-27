#!/bin/bash

curl --unix-socket ./sockets/nginx.sock "$@"

