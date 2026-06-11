#!/bin/bash

mkdir -p data local_data

if [ "$1" = "build_generator" ]; then
    docker build -t csv-generator .

elif [ "$1" = "run_generator" ]; then
    docker run --rm -v "$(pwd)/data:/data" csv-generator

elif [ "$1" = "create_local_data" ]; then
    python3 generate.py local_data

elif [ "$1" = "build_reporter" ]; then
    docker build -f Dockerfile.reporter -t csv-reporter .

elif [ "$1" = "run_reporter" ]; then
    docker run --rm -v "$(pwd)/data:/data" csv-reporter

elif [ "$1" = "structure" ]; then
    find . -print

elif [ "$1" = "clear_data" ]; then
    rm -f data/*.csv data/*.html

elif [ "$1" = "inside_generator" ]; then
    docker run --rm -v "$(pwd)/data:/data" csv-generator ls -la /data

elif [ "$1" = "inside_reporter" ]; then
    docker run --rm -v "$(pwd)/data:/data" csv-reporter ls -la /data

elif [ "$1" = "report_server" ]; then
    docker run --rm -p 8000:80 -v "$(pwd)/data:/usr/share/nginx/html:ro" nginx:alpine

else
    echo "Unknown command"
fi

