#!/usr/bin/env bash

bash /scripts/credentials.sh
make deps
make docs
echo "pub publish $1 -v"
pub publish $1 -v