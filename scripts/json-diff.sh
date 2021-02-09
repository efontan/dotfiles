#!/bin/bash 
vimdiff <(jq -S . $1) <(jq -S . $2)
# remember to exit with !qa to exit all buffers:
# :qa quits all open windows/buffers/splits/tabs
# (aliases: :qall :quitall)
