#!/bin/bash
# Apply the configuration files on the current machine
# Feel free to use this or some parts of this as you want :-)

MAP_FILE="map"

# Detect source directory
# Thanks to http://stackoverflow.com/a/246128/2204144
source="$0"
while [ -h "${source}" ]; do
    dir="$( cd -P "$( dirname "${source}" )" && pwd )"
    source="$(readlink "${source}")"
done
directory="$( cd "$( dirname "${source}" )" && pwd )"
filename="$( basename "${source}" )"


# Before all, it will install an hook which executes this script
# each time you pull, in order to simplify things
if [[ ! -f "${directory}/.ran" ]] || \
   [[ "`cat "${directory}/.ran"`" != "${directory}" ]]; then

    hook_path="${directory}/.git/hooks/post-receive"

    echo "#!/bin/bash" > "$hook_path"
    echo "# Automatically generated" >> "$hook_path"
    echo "" >> "$hook_path"
    echo "${directory}/${filename}" >> "$hook_path"
    echo "echo \"dotfiles applied!\"" >> "$hook_path"

    chmod +x "$hook_path"

    echo "${directory}" > "${directory}/.ran"
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
        ln -s "${directory}/${origin}" "${dest}"
    fi

done < "${directory}/${MAP_FILE}"
