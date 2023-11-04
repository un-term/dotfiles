set fish_greeting

# PATHS
fish_add_path $HOME/.local/bin
set -gx GOPATH $HOME/build/go

#DATE:YYYY-MM-DD
set -gx DATE (date +%Y-%m-%d)

bind \cl accept-autosuggestion
bind \ck forward-word

# zoxide - z cd
type -q zoxide; and zoxide init fish | source

# ssh-agent with systemd (user)
# https://wiki.archlinux.org/title/SSH_keys#SSH_agents
# set -Ux SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

# Alias/abbr
# ----------------------------------------------------------------
alias codium "flatpak run com.vscodium.codium --no-sandbox --ozone-platform-hint=auto"
type -q lsd; and alias ls 'lsd'
type -q bat; and abbr cat bat
type -q batcat; and abbr cat batcat

## helix
if type -q helix
  alias hx 'helix'
  set -gx VISUAL hx 
  set -gx EDITOR hx
end

## pass
if type -q pass
  abbr p pass
  abbr pc "pass -c"
  abbr pf "pass find"
end

## git
abbr gits 'git status'
abbr gitd 'git diff'
abbr gitl "git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short --graph"
abbr gitw 'git whatchanged -p --abbrev-commit --pretty=medium'
abbr gitpm 'git switch master; and git pull'
abbr gitp 'git pull'
abbr gitb 'git switch -'
abbr gitca 'git commit -am'

# Functions 
# ----------------------------------------------------------------
function open
  xdg-open $argv 2>/dev/null &
end

# Local config
# ----------------------------------------------------------------
test -f $HOME/.config/fish/local_config.fish; and source $HOME/.config/fish/local_config.fish 
