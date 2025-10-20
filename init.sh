#!/bin/bash

DB_USER=your_username
DB_NAME=your_database

psql -U ${DB_USER} -d ${DB_NAME} -f Creation/sql/create_table.sql
psql -U ${DB_USER} -d ${DB_NAME} -f Creation/sql/create_triggers.sql
psql -U ${DB_USER} -d ${DB_NAME} -f Etudes/scenarios.sql
psql -U ${DB_USER} -d ${DB_NAME} -f Etudes/affichages.sql
psql -U ${DB_USER} -d ${DB_NAME} -f Creation/sql/insert_data.sql

echo "Terminé."