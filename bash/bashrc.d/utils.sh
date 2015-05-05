# This script contains some utilities I use
# Feel free to use this or some parts of this as you want :-)


# Generate a random string
# For the usage, see: randstr -h
randstr() {

    # Do options parsing
    show_help=false
    only_chars=false
    error=false
    args=( )
    for param in "$@"; do

        # Remove options from the arguments array
        if ! [[ "${param}" = -* ]]; then
            args+=( "${param}" )
            continue
        fi

        # -h or --help
        if [[ "${param}" = "-h" ]] || [[ "${param}" = "--help" ]]; then
            show_help=true
        # -c or --chars
        elif [[ "${param}" = "-c" ]] || [[ "${param}" = "--chars" ]]; then
            only_chars=true
        else
            error=true
            break
        fi
    done

    # Usage and help messages
    if [[ "${#args[@]}" -ne 1 ]] || "${show_help}" || "${error}"; then
        echo "Usage: randstr [-h] [-c] length"
        echo "Generate random strings -- added by bashrc"

        if "${show_help}"; then
            echo
            echo "Options:"
            echo " -h  --help   Show this message"
            echo " -c  --chars  Include only alphanumerical characters"
            return 0
        else
            echo
            echo "For more informations: randstr --help"
            return 1
        fi
    fi

    length="${args[0]}"

    # Setup the filter
    "${only_chars}" && filter="[:alnum:]" || filter="[:graph:]"

    cat /dev/urandom | tr -cd "${filter}" | head -c "${length}"
    echo
}
