#!/bin/bash

set -eo pipefail

 

service xvfb start

 

cd /sahi_pro/userdata/bin && ./start_sahi.sh &
