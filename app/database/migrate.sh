#!/bin/bash
# This file dumps the latest state of the my local (linux) postgres database into an initializer script
pg_dump -U petiyeti -d elte_konyvtar -s -c -f dump.sql
