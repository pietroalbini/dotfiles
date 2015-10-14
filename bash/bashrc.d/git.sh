# This script will setup git completion and the git prompt
#
# Script made by Pietro Albini <pietro@pietroalbini.io>
# Released under the UNLICENSE license, aka public domain

# Require external scripts
source "${HOME}/.bashrc.d/external/git-completion.sh"
source "${HOME}/.bashrc.d/external/git-prompt.sh"

# Complete also the "g" alias
__git_complete g __git_main

# Add __git_ps1 to the prompt
if type bashrc_ps1_before >/dev/null 2>&1; then
    bashrc_ps1_after "__git_ps1"
fi
