# osx-nix

This is my nix configuration for MacOS, without flakes. 

## Nix installation 

![Nix multi user installation](https://nix.dev/manual/nix/2.24/installation/installing-binary#multi-user-installation)

```zsh
bash <(curl -L https://nixos.org/nix/install) --daemon
```

### Add nix-channels for nixpkgs, nix-darwin and home-manager

```zsh
sudo nix-channel --add https://github.com/LnL7/nix-darwin/archive/nix-darwin-24.11.tar.gz darwin
nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
nix-channel --add https://nixos.org/channels/nixpkgs-24.11-darwin nixpkgs

sudo nix-channel --update
nix-channel --update
```

### nix-darwin installation

```zsh
nix-build '<darwin>' -A darwin-rebuild
./result/bin/darwin-rebuild switch -I darwin-config=/etc/nix-darwin/configuration.nix
````

Sources: 

- [nix-darwin installation](https://github.com/LnL7/nix-darwin/blob/master/README.md#step-2-installing-nix-darwin)
- [home-manager](https://github.com/nix-community/home-manager)
- [home-manager installation](https://nix-community.github.io/home-manager/index.xhtml#sec-install-nix-darwin-module)


### Examples 

- [Home manager configuration example](https://github.com/phlmn/nix-darwin-config/tree/main/config/home-manager)
- [Nix darwin kickstarter](https://github.com/ryan4yin/nix-darwin-kickstarter/)


## Homebrew

Some applications may not be available through nixpkgs and has to be installed with homebrew. 
Homebrew configuration and application list can be managed with nix, but homebrew has to be installed. 

### Installation

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```



### AppStore

Some applications are only available through the AppStore. 
They can be managed as code with ![mas-cli](https://github.com/mas-cli/mas) 


