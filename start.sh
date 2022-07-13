#!/bin/bash

cd /workspaces/Backend
source /workspaces/Backend/.venv/bin/activate

if [ ! -z "${PINGER}" ]; then
        uvicorn main:app --host 0.0.0.0 --port=$PORT &
        python3 /usr/src/app/pinger.py
else
    uvicorn main:app --host 0.0.0.0 --port=$PORT
fi
