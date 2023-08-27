set fish_greeting

# Editor
set -gx VISUAL hx 
set -gx EDITOR hx

#DATE:YYYY-MM-DD
set -gx DATE (date +%Y-%m-%d)

bind \cl accept-autosuggestion
bind \ck forward-word

# zoxide - z cd
zoxide init fish | source

# PATHS
fish_add_path $HOME/.local/bin
set -gx GOPATH $HOME/build/go

# Alias/abbr
alias codium="flatpak run com.vscodium.codium --no-sandbox"
alias ls 'lsd'
abbr cat bat
alias hx 'helix'

## pass
abbr p pass
abbr pc "pass -c"
abbr pf "pass find"

# Functions 
function open
  xdg-open $argv 2>/dev/null &
end

# ssh-agent with systemd (user)
# https://wiki.archlinux.org/title/SSH_keys#SSH_agents
# set -Ux SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
