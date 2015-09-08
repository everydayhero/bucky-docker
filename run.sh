sed -e "s/{{PORT}}/$PORT/"  -e "s/{{STATSD_PORT}}/$STATSD_PORT/" -e "s/{{STATSD_HOST}}/$STATSD_HOST/" config/default.yaml.template > config/default.yaml

./start.js
