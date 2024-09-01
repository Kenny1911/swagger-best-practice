#!/usr/bin/env bash

PORT=${PORT:-8080}

echo "Start Swagger UI on ${PORT} port"
echo

URLS='
[
  {"url": "/spec/rest.yaml", "name": "REST"},
  {"url": "/spec/cqrs.yaml", "name": "CQRS"},
  {"url": "/spec/data-list.yaml", "name": "Data List"},
  {"url": "/spec/free-form-object.yaml", "name": "Free-form object"},
  {"url": "/spec/collections.yaml", "name": "Collections"},
  {"url": "/spec/inheritance.yaml", "name": "Mode inheritance"},
  {"url": "/spec/post-filter.yaml", "name": "Filter data with POST method"},
  {"url": "/spec/extra-modules.yaml", "name": "Extra modules"},
  {"url": "/spec/deprecations.yaml", "name": "Deprecations"},
]
'

docker run \
  --rm \
  -v "$(pwd)/spec:/usr/share/nginx/html/spec:ro" \
  -e URLS="${URLS}" \
  -e URLS_PRIMARY_NAME="Course (Learning)" \
  -e QUERY_CONFIG_ENABLED=1 \
  -p "${PORT}:8080" \
  swaggerapi/swagger-ui:v5.17.14
