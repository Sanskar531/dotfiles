#!/bin/bash
#
killall -q polybar
polybar mybar 2>&1 --config=~/.config/polybar/config.ini | tee -a /tmp/polybar.log & disown 
