# osx-nix

This is my personal configuration for osx macbook using nix-darwin and home-manager.

## Getting started 

### Install nix

[Nix multi user installation](https://nix.dev/manual/nix/2.24/installation/installing-binary#multi-user-installation)

```zsh
bash <(curl -L https://nixos.org/nix/install) --daemon
```

### Install homebrew

Some applications may not be available through nixpkgs and has to be installed with homebrew. 
Homebrew configuration and application list can be managed with nix, but homebrew has to be installed. 

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Clone the repository

Clone the repository in `$HOME/.config` folder

## Host specific configuration

Open the flake.nix file and adapt variables.

```nix
user = "afo";
user_uid = 501; # use the command "id" in a terminal to find your user uid.
system = "aarch64-darwin"; #"x86_64-darwin"
hostname = "Arnauds-MacBook-Pro"; 
git_name = "Arnaud Fontaine";
git_email = "afontaine@kleis.ch";
```

## Apply nix configuration

```
darwin-rebuild switch --flake .
```

## aarch64-darwin

https://support.apple.com/en-us/102527

For aarch64-darwin macbooks, you may have to install Rosetta 2 in order to install applications
built for x86-64. To do so:

```
softwareupdate --install-rosetta
```

## Useful documentation

### Tutorial

- [Unofficial book for beginners](https://nixos-and-flakes.thiscute.world/)

### AppStore

Some applications are only available through the AppStore. 
They can be managed as code with [mas-cli](https://github.com/mas-cli/mas) 

### Examples 

- [Home manager configuration example](https://github.com/phlmn/nix-darwin-config/tree/main/config/home-manager)
- [Nix darwin kickstarter](https://github.com/ryan4yin/nix-darwin-kickstarter/)

### Links

- [Nix on MacOS](https://nixcademy.com/posts/nix-on-macos/)
- [MacOS linux builder](https://nixcademy.com/posts/macos-linux-builder/)
- [Nix Darwin configuration](https://daiderd.com/nix-darwin/manual/index.html)
- [nix-darwin installation](https://github.com/LnL7/nix-darwin/blob/master/README.md#step-2-installing-nix-darwin)
- [home-manager](https://github.com/nix-community/home-manager)
- [home-manager installation](https://nix-community.github.io/home-manager/index.xhtml#sec-install-nix-darwin-module)
