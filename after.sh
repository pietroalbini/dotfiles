# This script is called after dotfiles are applied
# You can use $DOTFILES to get the dotfiles directory path
#
# Script made by Pietro Albini <pietro@pietroalbini.io>
# Released under the UNLICENSE license, aka public domain

BUILDS_FILE="${DOTFILES}/.builds"

# This function will return true only if you need to compile or recompile
# native extensions
needs_build() {
    path="$1"

    # Always return false if the build file doesn't exist
    if [[ ! -f "${BUILDS_FILE}" ]]; then
        return 0  # true
    fi

    commit="`(cd "${path}" && git rev-parse HEAD)`"
    if grep "${path}  ${commit}" "${BUILDS_FILE}" >/dev/null; then
        return 1  # false
    else
        return 0  # true
    fi
}

# This function will mark as built a directory
as_built() {
    path="$1"

    # Create the .builds file if needed
    if [[ ! -f "${BUILDS_FILE}" ]]; then
        touch "${BUILDS_FILE}"
    fi

    # Get the current commit
    commit="`(cd ${path} && git rev-parse HEAD)`"

    if grep "${path}" "${BUILDS_FILE}" >/dev/null; then
        sed "s#${path}#${path}  ${commit}#g" "${BUILDS_FILE}"
    else
        echo "${path}  ${commit}" >> "${BUILDS_FILE}"
    fi
}

# Compile vimproc
if needs_build "vim/bundle/vimproc"; then
    make -C "${DOTFILES}/vim/bundle/vimproc"
    as_built "vim/bundle/vimproc"
fi
