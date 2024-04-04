# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

 # zmodload zsh/zprof
source ~/.oh-my-zsh/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/plugins/git/git.plugin.zsh
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias humber="cd ~/Humber/Semester3"
c_new(){
  if [ -e $1 ]; then
    echo "Project already exists!"
  else
    mkdir $1
    touch $1/main.c
    echo "#include <stdio.h>">>$1/main.c
    echo "#include <stdlib.h>">>$1/main.c
    echo "">>$1/main.c
    echo "int main(int argc, char*argv[]){">>$1/main.c
    echo "">>$1/main.c
    echo "  return EXIT_SUCCESS;">>$1/main.c
    echo "}">>$1/main.c
  fi
}

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# nvm is slow, so instead of above code, use below code to lazy load
lazy_load_nvm() {
  unset -f npm node nvm nvim nodemon
  export NVM_DIR=~/.nvm
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
}

 npm() {
  lazy_load_nvm
  npm $@
 }

node() {
  lazy_load_nvm
  node $@
}

nvm() {
  lazy_load_nvm
  node $@
  nvm $@
}
nvim() {
  lazy_load_nvm
  nvim $@
}
nodemon(){
  lazy_load_nvm
  nodemon $@
}
# keybindgs
bindkey -s '^D' ''
# bindkey '^R' .history-incremental-search-backward
# bindkey '^S' .history-incremental-search-forward
bindkey '^P' .up-line-or-history
bindkey '^N' .down-line-or-history
# bindkey -s '^S' ''

if [ -z "$TERMINFO" ] && [ -z "$TERM_PROGRAM" ]; then
  export TERM_PROGRAM="Alacritty"
fi
export EDITOR=nvim

# export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home"
 # zprof
