#!/bin/sh

brew tap sambadevi/powerlevel9k
brew install gnu-sed
brew install powerlevel9k

POWERLEVEL_FOLDER=~/.oh-my-zsh/custom/themes/powerlevel9k
if [ ! -d "$POWERLEVEL_FOLDER" ] ; then
  git clone https://github.com/bhilburn/powerlevel9k.git $POWERLEVEL_FOLDER
  # git clone "$URL" "$FOLDER"
fi

# echo "source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme" >> ~/.zshrc
# echo "POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)" >> ~/.zshrc
# echo "POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)" >> ~/.zshrc

yes | cp ~/dotfiles/zsh/oh-my-zsh.sh ~/.zshrc

# ZSH_THEME="powerlevel10k/powerlevel10k"
# sed "s/^ZSH_THEME=.*/ZSH_THEME=\"powerlevel10k/powerlevel10k\"/g"
# cat ~/.zshrc | sed 's/^ZSH_THEME=.*/ZSH_THEME=\"powerlevel9k\/powerlevel9k\"/g' > ~/.zshrc
# sed -i 's/^ZSH_THEME=.*/ZSH_THEME=\"powerlevel9k\/powerlevel9k\"/g' ~/.zshrc | tee ~/.zshrc_replaced

# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
