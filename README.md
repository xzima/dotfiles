# .files

My commented dotfiles (zsh, micro, git, etc.),
Inspired by https://github.com/ronanguilloux/dotfiles

## Dependencies

- git
- zsh
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
- [bat](https://github.com/sharkdp/bat)
- [micro](https://github.com/zyedidia/micro)
- [ripgrep](https://github.com/BurntSushi/ripgrep)

#### Optional:

- [sdkman](https://github.com/sdkman/sdkman-cli)
- mvn
- gradle
- docker
- docker-compose
- npm
- nvm
- yarn
- [autoenv](https://github.com/hyperupcall/autoenv)

## Installation

Landing on a new brand server trough ssh, just run this :

```shell
sudo apt-get install git zsh bat micro ripgrep
git clone https://github.com/xzima/dotfiles.git
git clone https://github.com/zsh-users/antigen.git .antigen
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
dotfiles/install.sh
```

The `install.sh` will move the original .bashrc file found in $HOME before changing using symbolic links, in case there
were already modified.

## ZSH: how to mix .zshrc & oh-my-zsh

In order to use the current .zshrc with oh-my-zsh, just add a symink in the `~/.oh-my-zsh/custom` directory:

```shell
cd .oh-my-zsh/custom/
ln -s $HOME/dotfiles/.zshrc local.zsh
```

([Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) is a community-driven framework for managing your zsh
configuration)

## GIT: Preventing privacy & security issues

For credentials, tokens & other secret stuff, use `*.local` files :

```
# ~/.gitconfig.local
[user]
    name = John Doe
    email = john@doe.com
[github]
    user = johndoe
    token = 88bc06d8a...
```

which is already mentioned inside the `.gitconfig` file you'll found here:

```
# ~/dotfiles/.gitconfig
[include]
    # For username / creds / etc
    path = ~/.gitconfig.local
```
