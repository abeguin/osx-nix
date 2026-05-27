#!/usr/bin/env fish

echo "Fetching list of formulae and casks..."

function uninstall_logitech_g_hub
    brew uninstall logitech-g-hub

    # 3. Delete system-wide files
    sudo rm -rf /Applications/lghub.app
    sudo rm /Library/LaunchAgents/com.logi.ghub.plist
    sudo rm /Library/LaunchDaemons/com.logi.ghub.updater.plist
    sudo rm -rf /Users/Shared/LGHUB
    sudo rm -rf /Users/Shared/.logishrd

    # 4. Delete files from user directory
    sudo rm -rf ~/Library/Application\ Support/lghub
    sudo rm -rf /Users/afo/Library/Preferences/com.logi.ghub.ui.plist

    sudo rm -rf /opt/homebrew/Caskroom/logitech-g-hub
end

set -l manage_ghub 0

# Options:
#   --ghub      => uninstall puis reinstall Logitech G Hub
#   --no-ghub   => ne pas toucher Logitech G Hub (defaut)
for arg in $argv
    switch $arg
        case --ghub
            set manage_ghub 1
        case --no-ghub
            set manage_ghub 0
        case '*'
            echo "Unknown option: $arg"
            echo "Usage: "(status filename)" [--ghub|--no-ghub]"
            exit 1
    end
end

if test $manage_ghub -eq 1
    echo "Managing Logitech G Hub: uninstalling before upgrades..."
    uninstall_logitech_g_hub
    echo "Reinstalling Logitech G Hub..."
    brew install --cask logitech-g-hub
end

# Upgrade formulae
for formula in (brew list)
    echo "Upgrading formula: $formula"
    brew upgrade $formula
end

# Upgrade casks
for cask in (brew list --cask)
    echo "Upgrading cask: $cask"
    brew upgrade --cask $cask
end

echo "Cleaning up..."
brew cleanup

echo "Upgrade complete!"
