#!/bin/bash

sudo docker-coompose build -f docker-compose.yml
sudo docker-coompose up -f docker-compose.yml -d
