# osx-nix

This is my nix configuration for MacOS, without flakes. 

## Getting started

### Nix installation 

![Nix multi user installation](https://nix.dev/manual/nix/2.24/installation/installing-binary#multi-user-installation)

```zsh
bash <(curl -L https://nixos.org/nix/install) --daemon
```

### nix-darwin

#### Installation

![Installation](https://github.com/LnL7/nix-darwin/blob/master/README.md#step-2-installing-nix-darwin)

```zsh
sudo nix-channel --add https://github.com/LnL7/nix-darwin/archive/nix-darwin-24.11.tar.gz darwin
sudo nix-channel --update

nix-build '<darwin>' -A darwin-rebuild
./result/bin/darwin-rebuild switch -I darwin-config=/etc/nix-darwin/configuration.nix
```

### home-manager

![source](https://github.com/nix-community/home-manager)
![installation](https://nix-community.github.io/home-manager/index.xhtml#sec-install-nix-darwin-module)

#### Installation

```zsh
nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
nix-channel --update
```

#### Examples 

- [Home manager configuration example](https://github.com/phlmn/nix-darwin-config/tree/main/config/home-manager)
- [Nix darwin kickstarter](https://github.com/ryan4yin/nix-darwin-kickstarter/)

