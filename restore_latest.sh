#!/bin/bash

echo "=> Restore lates backup"
rm -f /backup/*
echo "   Pullling from AWS"
/restore.sh
until nc -z $MONGODB_HOST $MONGODB_PORT
do
    echo "waiting database container..."
    sleep 1
done
ls -d -1 /backup/* | tail -1 | xargs /restore_mongodb.sh
