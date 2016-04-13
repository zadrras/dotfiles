#!/usr/bin/env bash

status="$(dropbox-cli status)"

synced="Up to date"
stopped="Dropbox isn't running!"
echo ""
echo ""
if [ "$status" == "$stopped" ]; then
	echo "#a54242"
elif [ "$status" == "$synced" ]; then
    echo "#d8d8d8"
else
	echo "#de935f"
fi
