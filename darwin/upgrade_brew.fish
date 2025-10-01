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

uninstall_logitech_g_hub

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

brew install --cask logitech-g-hub
brew cleanup

echo "Upgrade complete!"
