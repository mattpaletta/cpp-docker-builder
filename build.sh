#!/bin/env bash

command -v docker >/dev/null 2>&1 || { echo >&2 "I require docker but it's not installed.  Aborting."; exit 1; }

docker image build -t cpp-build -f Build .
docker tag cpp-build mattpaletta/cpp-build
docker tag cpp-build mattpaletta/cpp-build:latest


docker image build -t cpp-dev -f Dev .
docker tag cpp-build mattpaletta/cpp-dev
docker tag cpp-build mattpaletta/cpp-dev:latest
