eval "$(starship init zsh)"
. "$HOME/.asdf/asdf.sh"

source /home/fernando/.antigen.zsh

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

# Load the theme.
#antigen theme robbyrussell
#antigen theme jonathan
#antigen theme strug
#antigen theme xiong-chiamiov-plus
#antigen theme agnoster
#antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

# Navigation
alias l='exa -lh --icons'
alias ll='exa -lha --icons'
alias c='clear && nerdfetch'
alias clip='xclip -selection clipboard'
alias rm='rm -ri'

# Terminal shortcuts
alias cat='bat'
alias vim='neovim'
alias top='bashtop' 
alias code='flatpak run com.visualstudio.code'


# APT 
alias install='sudo apt install'
alias remove='sudo apt remove'
alias aremove='sudo apt autoremove'
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

# SCRIPTS



nerdfetch

PATH=~/.console-ninja/.bin:$PATH

# bun completions
[ -s "/home/fernando/.bun/_bun" ] && source "/home/fernando/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export TERM=xterm
