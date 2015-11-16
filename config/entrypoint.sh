#!/bin/bash
set -e

: ${SERVER_FQDN:?"-e SERVER_FQDN is not set"}


# initial configuration every 5 seconds until successful
until /opt/confd/confd -onetime -node $ETCD -config-file /etc/confd/conf.d/nginx.toml; do
    echo "[nginx] waiting for confd to create initial nginx configuration."
    sleep 5
done

/usr/sbin/service nginx start

exec "$@"
