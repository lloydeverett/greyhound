#!/bin/bash

OUR_REALPATH=$(realpath .)
OUR_BASENAME=$(basename "${OUR_REALPATH}")
systemctl --user "$1" podman-compose@"${OUR_BASENAME}"

