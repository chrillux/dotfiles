#!/bin/bash
#
# Script that populates the home directory with available files.
#

BASEDIR=$(dirname $0)
RSYNC='rsync -av'
home=${1}

if [ -z "${home}" ];then
    home=${HOME}
fi

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
${RSYNC} ./default/ ${home}

bashrcd_section='BASHRCD="${HOME}/.bashrc.d"
if [ -d "${BASHRCD}" ] ; then
    if [[ $(ls -1 ${BASHRCD}/ | wc -l) -gt 0 ]]; then
        for file in "${BASHRCD}/"*; do
            . ${file}
        done
    fi
fi'

if ! grep 'BASHRCD=' "${home}/.bashrc" >/dev/null 2>&1; then
    echo -en "\n${bashrcd_section}\n\n" >> "${home}/.bashrc"
fi
