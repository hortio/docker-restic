#!/bin/sh

export RESTIC_MAJOR="0"
export RESTIC_MINOR="10"
export RESTIC_PATCH="0"
docker build -t hortio/restic:latest \
    -t hortio/restic:"v${RESTIC_MAJOR}.${RESTIC_MINOR}.${RESTIC_PATCH}" \
    -t hortio/restic:"v${RESTIC_MAJOR}.${RESTIC_MINOR}" \
    -t hortio/restic:"v${RESTIC_MAJOR}" .
docker push hortio/restic:latest
docker push hortio/restic:"v${RESTIC_MAJOR}.${RESTIC_MINOR}.${RESTIC_PATCH}"
docker push hortio/restic:"v${RESTIC_MAJOR}.${RESTIC_MINOR}"
docker push hortio/restic:"v${RESTIC_MAJOR}"