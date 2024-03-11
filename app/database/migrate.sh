#!/bin/sh
pg_dump -U petiyeti elte_felho_konyvek -s -C -f init.sql
