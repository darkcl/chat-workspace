#!/usr/bin/bash

conda activate textgen
cd text-generation-webui && python server.py --auto-devices --chat --listen --wbits 4 --groupsize 128 