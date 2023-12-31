#! /usr/bin/env bash

this_dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
root_dir=$(cd ${this_dir}/../.. && pwd)
if [[ -e "${root_dir}/.env" ]]; then source ${root_dir}/.env; fi
if [[ -e "${this_dir}/.env" ]]; then source ${this_dir}/.env; fi
source ${this_dir}/lib/kubernetes.sh

argocd_namespace=openshift-gitops
argocd_deployment=openshift-gitops-server
app_namespace=dotnet-apiserver

kubectl get deployments -n ${argocd_namespace} ${argocd_deployment} &> /dev/null
if [[ $? != 0 ]]; then
    echo "ERROR: ArgoCD is not installed, cannot deploy Argo app"
    exit 2
fi

${this_dir}/create-config.sh

ensure_namespace ${app_namespace}
kubectl apply --namespace ${argocd_namespace} -f ${this_dir}/argocd-application.yaml
