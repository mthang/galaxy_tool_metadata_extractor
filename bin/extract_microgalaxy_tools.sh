#!/usr/bin/env bash

curl \
        -L \
        "https://docs.google.com/spreadsheets/d/1Nq_g-CPc8t_eC4M1NAS9XFJDflA7yE3b9hfSg3zu9L4/export?format=tsv&gid=1533244711" \
        -o "data/microgalaxy/tools_to_keep"

curl \
        -L \
        "https://docs.google.com/spreadsheets/d/1Nq_g-CPc8t_eC4M1NAS9XFJDflA7yE3b9hfSg3zu9L4/export?format=tsv&gid=672552331" \
        -o "data/microgalaxy/tools_to_exclude"

python bin/extract_galaxy_tools.py \
        --api $GITHUB_API_KEY \
        --output microgalaxy_tools.csv \
        --categories "data/microgalaxy/categories" \
        --exclude "data/microgalaxy/tools_to_exclude" \
        --keep "data/microgalaxy/tools_to_keep"