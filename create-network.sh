#!/bin/bash

NETWORKS=(
    "matching-interface-application-controller"
)

for NETWORK in "${NETWORKS[@]}"; do
    DOCKER_NETWORK=$(docker network ls --filter name="${NETWORK}" --format "{{.Name}}")

    if [ -z "${DOCKER_NETWORK}" ]; then
        docker network create "${NETWORK}"
        echo "Created ${NETWORK} successfully."
    else
        echo "${NETWORK} already exists."
    fi
done