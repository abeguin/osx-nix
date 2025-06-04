#!/usr/bin/env fish

echo "Fetching list of formulae and casks..."

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
