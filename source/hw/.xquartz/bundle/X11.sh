#!/bin/bash

set "$(dirname "$0")"/X11.bin "${@}"

if [ -x ~/.X11run ]; then
	exec ~/.X11run "${@}"
fi

case $(basename "${SHELL}") in
	bash)          exec -l "${SHELL}" --login -c 'exec "${@}"' - "${@}" ;;
	ksh|sh|zsh)    exec -l "${SHELL}" -c 'exec "${@}"' - "${@}" ;;
	csh|tcsh)      exec -l "${SHELL}" -c 'exec $argv:q' "${@}" ;;
	es|rc)         exec -l "${SHELL}" -l -c 'exec $*' "${@}" ;;
	*)             exec    "${@}" ;;
esac
