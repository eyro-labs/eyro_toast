#!/usr/bin/env bash

bash credentials.sh
make docs
pub publish $1 -v