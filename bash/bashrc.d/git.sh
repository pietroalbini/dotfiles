# This script will setup git completion and the git prompt
# Feel free to use this or some parts of this as you want :-)

# Require external scripts
source "${HOME}/.bashrc.d/external/git-completion.sh"
source "${HOME}/.bashrc.d/external/git-prompt.sh"

# Add __git_ps1 to the prompt
if type bashrc_ps1_before >/dev/null 2>&1; then
    bashrc_ps1_after "__git_ps1"
fi
