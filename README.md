# MY dotfiles

## Atom 
ln -s ~/dotfiles/atom/keymap.cson ~/.atom/keymap.cson

## vscode

cp ~/Library/Application\ Support/Code/User/settings.json ~/dotfiles/VSCode/
cp ~/Library/Application\ Support/Code/User/keybindings.json ~/dotfiles/VSCode/
cp -R ~/Library/Application\ Support/Code/User/snippets/ ~/dotfiles/VSCode/

## other machin

ln -s ~/dotfiles/VSCode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/dotfiles/VSCode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s ~/dotfiles/VSCode/snippets/ ~/Library/Application\ Support/Code/User

In `~/.zshrc`

```sh
        source ~/dotfiles/zsh/zsh_profile
```

In `~/.vimrc`

```sh
        source ~/dotfiles/vim/vimrc
```

## Powerlevel 9k
[Gist Powerlevel 9k](https://gist.github.com/kevin-smets/8568070)

## Zsh Autosuggestions
[Link](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)



