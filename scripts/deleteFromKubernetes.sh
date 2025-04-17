#!/bin/bash

if [ -z "${REPOSITORY_PREFIX}" ]; then
    echo "Please set the REPOSITORY_PREFIX"
elif [ -z "${K8S_NAMESPACE}" ]; then
    echo "Please set the K8S_NAMESPACE"
else
    cat ./k8s/*.yaml | \
    sed "s#\${REPOSITORY_PREFIX}#${REPOSITORY_PREFIX}#g" | \
    kubectl delete -n "${K8S_NAMESPACE}" -f -
fi
