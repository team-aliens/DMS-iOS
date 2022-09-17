#!/bin/bash

set -e

shell_join() {
  local arg
  printf "%s" "$1"
  shift
  for arg in "$@"; do
    printf " "
    printf "%s" "${arg// /\ }"
  done
}

ohai() {
  printf "${tty_blue}==>${tty_bold} %s${tty_reset}\n" "$(shell_join "$@")"
}

# The line below extracts the version from the list of tags in the Tuist repository.
LATEST_VERSION=$(git ls-remote -t --sort=v:refname https://github.com/tuist/tuist.git | sed -ne '$s/.*tags\/\(.*\)/\1/p')
ohai "Downloading tuist..."
[ -f /tmp/tuist.zip ] && rm /tmp/tuist.zip
[ -f /tmp/tuist ] && rm /tmp/tuist
curl -LSsf --output tuist.zip https://github.com/tuist/tuist/releases/download/${LATEST_VERSION}/tuist.zip
ohai "Unzipping tuist..."
unzip -o tuist.zip -d tuist > /dev/null
ohai "tuist installed. Try running 'tuist'"
