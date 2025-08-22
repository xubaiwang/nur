#!/usr/bin/env bash

script_dir=$(dirname "$0")
fetcher_file="$script_dir/fetcher.nix"

echo "{ fetchFromGitHub }:" > $fetcher_file
nurl "https://github.com/akfamily/akshare" >> $fetcher_file
