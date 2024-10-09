#!/bin/bash

# Get a list of tmux sessions
tmux_sessions=$(tmux list-sessions -F "#{session_name}" 2>/dev/null)

# Check if there are any tmux sessions available
if [ -z "$tmux_sessions" ]; then
  echo "No tmux sessions found."
  exit 1
fi

# Use fzf to select a session
selected_session=$(echo "$tmux_sessions" | fzf --prompt="Select a tmux session: ")

# Check if a session was selected
if [ -n "$selected_session" ]; then
  tmux attach-session -t "$selected_session"
else
  echo "No session selected."
fi
