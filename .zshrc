####################################################################################################
# .zshrc Configuration                                                                             #
####################################################################################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Aliases
####################################################################################################

# Shortcuts
alias ..="cd .."
# Enable powerlevel10k theme.
# Install: git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


####################################################################################################
# END Configuration                                                                                #
####################################################################################################
