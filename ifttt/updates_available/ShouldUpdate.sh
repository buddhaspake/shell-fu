#!/bin/bash

# FLAGS
CAN_UPDATE=0

UPDATES=$(checkupdates)
if [ -z "$UPDATES" ]
then
    echo "No updates available"
else
    echo "BEFORE $UPDATES"
    UPDATES=${UPDATES//$'\n'/', '}
    echo "AFTER $UPDATES"
    curl -X POST \
         -H "Content-Type: application/json" \
         -d '{"value1":"'"$UPDATES"'"}' \
         https://maker.ifttt.com/trigger/{NeedsUpdates}/with/key/c-hY7GiquWAtL6McT7eoG9
fi
