#!/bin/bash

GRAFANA_CREDS="admin:admin"
GRAFANA_HOST="http://localhost:3000"
CURRENT_TIME="$(date +%s)"
START_TIME="$CURRENT_TIME""000"

sleep 10

CURRENT_TIME="$(date +%s)"
END_TIME="$CURRENT_TIME""000"


BODY=$(cat <<EOF
{
  "dashboardUID": "rYdddlPWk",
  "panelId": 77,
  "tags": ["tagger"],
  "text": "AAAAAAAAAA",
  "time": $START_TIME,
  "timeEnd": $END_TIME
}
EOF
)

curl -u "$GRAFANA_CREDS" -H "Content-Type: application/json" -XPOST -d "$BODY" "$GRAFANA_HOST/api/annotations"
