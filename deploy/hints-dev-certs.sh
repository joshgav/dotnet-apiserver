#! /usr/bin/env bash

this_dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
root_dir=$(cd ${this_dir}/.. && pwd)
if [[ -e "${root_dir}/.env" ]]; then source ${root_dir}/.env; fi
if [[ -e "${this_dir}/.env" ]]; then source ${this_dir}/.env; fi

# generate dev-cert
dotnet dev-certs https
# export dev-cert
dotnet dev-certs https --export-path ${this_dir}/aspnet-dev-https.crt --format PEM
# import dev-cert to trusted store (Fedora)
sudo trust anchor ${this_dir}/aspnet-dev-https.crt

# import dev-cert to trusted store (others)
## locations of trusted certs
#  - /usr/share/pki/ca-trust-source/anchors/
#  - /etc/pki/ca-trust/source/anchors/
# sudo cp aspnet-dev-https.crt /etc/pki/ca-trust/source/anchors/
# sudo update-ca-trust
