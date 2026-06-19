#!/usr/bin/env sh

printf '%s\n' "fable.sh"
printf '%s\n' "Type a prompt. Use /quit, /exit, or Ctrl-D to leave."

while :; do
  printf '\nfable> '

  if ! IFS= read -r prompt; then
    printf '\n'
    exit 0
  fi

  case "$prompt" in
    /quit|/exit|quit|exit)
      printf '%s\n' "closing the lab notebook."
      exit 0
      ;;
    "")
      printf '%s' "analyzing the absence of user intent"
      ;;
    *)
      printf '%s' "taking this seriously"
      ;;
  esac

  i=0
  while [ "$i" -lt 3 ]; do
    printf '.'
    sleep 0.35
    i=$((i + 1))
  done

  printf '\n%s\n' "analysis: deep implications detected, probably."
  sleep 0.25
  printf '%s\n' "sorry dave, i can't do that"
done
