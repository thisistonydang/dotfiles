####################################################################################################
# .zshrc Configuration                                                                             #
####################################################################################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Functions
####################################################################################################

# Load .env file
loadenv() {
  if [[ -f .env ]]; then
    set -a 
    source .env
    set +a
    echo "Loaded .env file"
  else
    echo "No .env file found" >&2
    return 1
  fi
}


# General Settings
####################################################################################################

# Increase max open files limit (MacOS default = 256, Linux default = 4096).
ulimit -n 1024

# Shell history
setopt HIST_IGNORE_ALL_DUPS 
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY 


# Aliases
####################################################################################################

# Shortcuts
alias ..="cd .."
alias ls="ls -F --color=auto"
alias la="ls -A"
alias ll="ls -la"
alias grep="grep --color=auto"


# Applications
####################################################################################################



# Languages
####################################################################################################

# Python
alias activate='source .venv/bin/activate'
alias py='python'

# Plugins
####################################################################################################

# Auto-install plugins if missing
[[ ! -d ~/.zsh/zsh-autosuggestions ]] && git clone --depth=1 git@github.com:zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
[[ ! -d ~/.zsh/zsh-syntax-highlighting ]] && git clone --depth=1 git@github.com:zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
[[ ! -d ~/.zsh/z ]] && git clone --depth=1 git@github.com:rupa/z.git ~/.zsh/z
[[ ! -d ~/.zsh/powerlevel10k ]] && git clone --depth=1 git@github.com:romkatv/powerlevel10k.git ~/.zsh/powerlevel10k

# Load plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/z/z.sh
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


####################################################################################################
# END Configuration                                                                                #
####################################################################################################
