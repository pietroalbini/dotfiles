#!/bin/bash

# Don't do anything when the agent is forwarded in SSH connections
if [[ -z "${SSH_AUTH_SOCK}" ]]; then

    # Be sure the right gpg-agent is started
    if which gpg-agent >/dev/null 2>&1; then
        if [[ ! -f "${HOME}/tmp/gpg-agent.env" ]]; then
            if [[ ! -d "${HOME}/tmp" ]]; then
                mkdir -p "${HOME}/tmp"
            fi
            killall gpg-agent >/dev/null 2>&1
            gpg-agent --daemon > "${HOME}/tmp/gpg-agent.env";
        fi
        source "${HOME}/tmp/gpg-agent.env"
    fi

    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
    export GPG_TTY=$(tty)

fi
