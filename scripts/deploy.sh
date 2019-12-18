#!/usr/bin/env bash

bash /scripts/credentials.sh
make deps
make docs
pub publish $1 -v