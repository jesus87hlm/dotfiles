export ZSH=/Users/jesus/.oh-my-zsh
# TERM=xterm-256color

# .zshrc
# autoload -U promptinit; promptinit
# prompt pure

plugins=(
        git
        zsh-syntax-highlighting
        osx
        brew
        history
        taskwarrior
        tmux
        tmuxinator
        zsh-autosuggestions
        battery
        zsh-completions
)
source ~/.bin/tmuxinator.zsh

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
autoload -U compinit && compinit
# ZSH_THEME="pure"
ZSH_THEME="agnoster"
DEFAULT_USER=`whoami`
## ALIAS
alias c="clear"
alias ez="vim $HOME/.zshrc"

source $ZSH/oh-my-zsh.sh

# source /Users/jesus/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
