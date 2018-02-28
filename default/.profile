if [ -f "${HOME}/.bashrc" ]; then
    . "${HOME}/.bashrc"
fi

if [ -d "${HOME}/bin" ] ; then
    PATH="${HOME}/bin:${PATH}"
fi

BASHRCD="${HOME}/.bashrc.d"
if [ -d "${BASHRCD}" ] ; then
    if [[ $(ls -1 ${BASHRCD}/ | wc -l) -gt 0 ]]; then
        for file in "${BASHRCD}/"*; do
            . ${file}
        done
    fi
fi


