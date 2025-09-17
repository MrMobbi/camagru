#!/bin/bash

echo "Waiting for database..."
until pg_isready -h "$DATABASE_HOST" -p "$DATABASE_PORT" -U "DATABASE_USERNAME"; do
	sleep 2
done
echo "Databases is ready, staring django..."
exec "$@"
