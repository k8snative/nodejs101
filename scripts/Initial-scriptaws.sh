#!/bin/bash
apt update
apt install -y curl
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
apt install nodejs -y
apt install nginx -y
