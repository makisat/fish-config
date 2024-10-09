#!/bin/bash

# Check if a session name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <session-name>"
  exit 1
fi

# Create a new tmux session with the given name
tmux new-session -s "$1"
