#! /usr/bin/env bash

this_dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
root_dir=$(cd ${this_dir}/.. && pwd)
if [[ -e "${root_dir}/.env" ]]; then source ${root_dir}/.env; fi
if [[ -e "${this_dir}/.env" ]]; then source ${this_dir}/.env; fi

registry_name=quay.io/joshgav
image_name=dotnet-apiserver

podman build -t ${image_name}:latest -f ${root_dir}/Dockerfile "${root_dir}"
podman tag ${image_name}:latest ${registry_name}/${image_name}:latest 
podman push ${registry_name}/${image_name}:latest
