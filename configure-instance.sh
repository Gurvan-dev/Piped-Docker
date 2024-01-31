#!/bin/sh

BASE_DIR=$(dirname $(realpath $0))

echo "Enter a hostname for the Frontend (eg: piped.kavin.rocks):" && read -r frontend
echo "Enter a hostname for the Backend (eg: pipedapi.kavin.rocks):" && read -r backend
echo "Enter a hostname for the Proxy (eg: pipedproxy.kavin.rocks):" && read -r proxy
echo "Enter the reverse proxy you would like to use (either caddy or nginx):" && read -r reverseproxy

rm -rf $BASE_DIR/config/
rm -f $BASE_DIR/docker-compose.yml

cp -r $BASE_DIR/template/ $BASE_DIR/config/

sed -i "s/FRONTEND_HOSTNAME/$frontend/g" $BASE_DIR/config/*
sed -i "s/BACKEND_HOSTNAME/$backend/g" $BASE_DIR/config/*
sed -i "s/PROXY_HOSTNAME/$proxy/g" $BASE_DIR/config/*

mv $BASE_DIR/config/docker-compose.$reverseproxy.yml $BASE_DIR/docker-compose.yml
