#!/bin/bash
# Apply the configuration files on the current machine
#
# Script made by Pietro Albini <pietro@pietroalbini.org>
# Released under the UNLICENSE license, aka public domain

# Detect source directory
# Thanks to http://stackoverflow.com/a/246128/2204144
source="$0"
while [ -h "${source}" ]; do
    dir="$( cd -P "$( dirname "${source}" )" && pwd )"
    source="$(readlink "${source}")"
done
directory="$( cd "$( dirname "${source}" )" && pwd )"
filename="$( basename "${source}" )"

# Update submodules
git submodule update --init --recursive

apply() {
    map_file="$1"; shift

    if ! [[ -f "${directory}/map-${map_file}" ]]; then
        echo "Symlink map not found: map-${map_file}"
        return
    fi

    # Parse the map file
    while read -r line; do
        # Remove comments
        [[ "${line}" =~ ^"#" ]] && continue

        # Ignore empty lines
        if [[ "${line}" != "" ]]; then
            items=(${line//  / })
            origin="${items[0]}"
            dest="`echo "${items[1]}" | sed "s%~%${HOME}%"`"

            rm -rf "${dest}"
            mkdir -p "$( dirname "${dest}" )"
            ln -s "${directory}/${origin}" "${dest}"
        fi

    done < "${directory}/map-${map_file}"
}

apply common
for map in "$@"; do
    apply "${map}"
done

# Call extra things
# Done in a separate script so you can use this script without changing it
# even in other repositories :)
if [[ -f "${directory}/after.sh" ]]; then
    DOTFILES="${directory}" bash "${directory}/after.sh"
fi
