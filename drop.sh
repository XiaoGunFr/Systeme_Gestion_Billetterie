#!/bin/bash

DB_USER=your_username
DB_NAME=your_database

psql -U ${DB_USER} -d ${DB_NAME} -f Creation/sql/drop_all_tables.sql

echo "Terminé."