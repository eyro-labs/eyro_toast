#!/usr/bin/env bash

bash /scripts/credentials.sh
make docs
pub publish $1 -v