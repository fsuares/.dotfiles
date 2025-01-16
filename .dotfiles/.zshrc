eval "$(starship init zsh)"
. "$HOME/.asdf/asdf.sh"

source /home/ducck/.antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Tell Antigen that you're done.
antigen apply

# Navigation
alias exa="exa --color=always"
alias l='exa -lh --icons'
alias ll='exa -lha --icons'
alias c='clear && nerdfetch'
alias clip='xclip -selection clipboard'
alias rm='trash'

# Terminal shortcuts
alias bat='batcat'
alias vim='nvim'
alias top='bashtop'

# APT
alias install='sudo apt install'
alias remove='sudo apt remove --purge -y'
alias update='sudo apt update'
alias upgrade='sudo apt upgrade -y'
alias aremove='sudo apt autoremove -y'
alias aclean='sudo apt autoclean'
alias list-up='apt list --upgradable'

# FLATPAK
alias fsearch='flatpak search'
alias finstall='flatpak install'
alias fremove='flatpak remove'

# GIT
alias gcl='git clone'
alias gta='git add'
alias gct='git commit'
alias gl='git log'
alias glo='git log --oneline'
alias gst='git status'

# APPS
alias zed='flatpak run dev.zed.Zed'

# SCRIPTS
 nerdfetch

PATH=~/.console-ninja/.bin:$PATH

# bun completions
[ -s "/home/fernando/.bun/_bun" ] && source "/home/fernando/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH=$HOME/.local/bin:$PATH
export TERM=xterm
export SUDO_PROMPT="[sudo] password for $(whoami): "

# add_spaces_to_output() {
#   while IFS= read -r line; do
#     echo -e "  $line"
#   done
# }

# preexec() {
#   local BUFFER=$(echo "$1" | awk '{print $1}')
#   echo $BUFFER
#   if [[ "$BUFFER" =~ ^(node|pnpm|npm|yarn|bun|npx|ls|grep|cat|batcat|vim|nvim|nano|tmux|less|more|tail|head|bashtop) ]]; then
#     return
#   fi

#   preexec() {
#     print -n ""
#   }

#   exec 1> >(add_spaces_to_output) 2>/dev/null
# }