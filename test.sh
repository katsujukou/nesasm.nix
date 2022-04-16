#!/usr/bin/env nix-shell
#!nix-shell ci.nix -i bash

set -e

which nesasm
nesasm -h