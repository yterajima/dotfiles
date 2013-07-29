#!/bin/sh
top -l 1 | head -n 4 | tail -n 1|awk '{printf "%d%%\n",$3}'
