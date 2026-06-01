# Homebrew Tap - Plyrium Desktop Apps

Install **Plyrium Forge** on macOS via Homebrew:

```bash
brew tap mordiaky/plyrium-forge
brew install --cask plyrium-forge
```

Or in one shot:

```bash
brew install --cask mordiaky/plyrium-forge/plyrium-forge
```

Install **Plyrium Echo** on macOS via Homebrew:

```bash
brew tap mordiaky/plyrium-forge
brew install --cask plyrium-echo
```

Or in one shot:

```bash
brew install --cask mordiaky/plyrium-forge/plyrium-echo
```

## Why install via Homebrew?

The direct `.zip` / `.dmg` downloads from [forge.plyrium.com](https://forge.plyrium.com) are **unsigned**. macOS Gatekeeper will show the "developer cannot be verified" warning unless you manually strip the quarantine attribute. Homebrew Cask handles that strip automatically, so the install is friction-free.

## Updating

```bash
brew upgrade --cask plyrium-forge
brew upgrade --cask plyrium-echo
```

Or to check what's available without installing:

```bash
brew outdated --cask plyrium-forge
brew outdated --cask plyrium-echo
```

## Uninstalling

```bash
brew uninstall --cask plyrium-forge
brew uninstall --cask plyrium-echo

# To also remove app data + caches:
brew uninstall --cask --zap plyrium-forge
brew uninstall --cask --zap plyrium-echo
```

## Platform support

- **Apple Silicon (arm64)** - primary target. M1 / M2 / M3 / M4 Macs.
- **Intel x86_64** - Forge can run via Rosetta 2; Echo's current Mac package is arm64-first.
- **Minimum macOS:** Big Sur (11.0) - required for Apple Silicon support.

## Links

- Forge app: <https://forge.plyrium.com>
- Echo app: <https://forge.plyrium.com/echo>
- Forge releases: <https://github.com/mordiaky/plyrium-forge-releases>
- Echo releases: <https://github.com/mordiaky/plyrium-echo-releases>

## How this tap is maintained

The cask formulas in `Casks/` are updated when a public release is published. Each cask pins the release version and SHA-256 for its macOS artifact, while `livecheck` follows the corresponding GitHub Releases feed.
