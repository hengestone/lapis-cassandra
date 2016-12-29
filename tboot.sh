#!/bin/sh
# Drop test db
mongo lapis_mongo --eval "db.dropDatabase()"
# Load sample data
./bulk_data.sh
busted
