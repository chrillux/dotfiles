#!/bin/bash
#
# Script that populates the home directory with available files.
#

BASEDIR=$(dirname $0)
RSYNC='rsync -av'

for program in rsync git; do
    if ! which ${program} > /dev/null; then
        echo "Could not find ${program}. Exiting."
        exit 1
    fi
done

# Make sure we can run the script from wherever.
cd ${BASEDIR}

# We want the git repo to be fresh.
git pull

# Sync default files.
${RSYNC} ./default/ ${HOME}

