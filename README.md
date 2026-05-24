# Homebrew Tap — Plyrium Forge

Install **Plyrium Forge** on macOS via Homebrew:

```bash
brew tap mordiaky/plyrium-forge
brew install --cask plyrium-forge
```

Or in one shot:

```bash
brew install --cask mordiaky/plyrium-forge/plyrium-forge
```

## Why install via Homebrew?

The direct `.zip` / `.dmg` downloads from [forge.plyrium.com/download](https://forge.plyrium.com/download) are **unsigned** — macOS Gatekeeper will show the *"Plyrium Forge cannot be opened because the developer cannot be verified"* warning unless you manually strip the quarantine attribute. Homebrew Cask handles that strip automatically, so the install is friction-free.

## Updating

```bash
brew upgrade --cask plyrium-forge
```

Or to check what's available without installing:

```bash
brew outdated --cask plyrium-forge
```

## Uninstalling

```bash
brew uninstall --cask plyrium-forge
# To also remove app data + caches:
brew uninstall --cask --zap plyrium-forge
```

## Platform support

- **Apple Silicon (arm64)** — primary target. M1 / M2 / M3 / M4 Macs.
- **Intel x86_64** — runs via Rosetta 2 with a small perf hit on the bundled Rust binaries. Universal-binary build is on the roadmap once Intel install volume justifies the build matrix.
- **Minimum macOS:** Big Sur (11.0) — required for Apple Silicon support.

## Links

- App: <https://forge.plyrium.com>
- Source: <https://github.com/mordiaky/plyrium-forge-rs>
- Releases: <https://github.com/mordiaky/plyrium-forge-releases>
- Issues / bugs: <https://github.com/mordiaky/plyrium-forge-rs/issues>

## How this tap is maintained

The cask formula in `Casks/plyrium-forge.rb` is **auto-updated** by the Plyrium release script (`scripts/release.mjs` in the main repo) on every public release. The release script:

1. Pushes a new `vX.Y.Z` tag to the source repo.
2. Triggers the macOS GitHub Actions build (`release-mac.yml`), which produces `Plyrium-Forge-Mac-arm64.zip` + its SHA256.
3. After the Mac artifacts land on the public mirror release, the release script edits `Casks/plyrium-forge.rb` with the new `version` + `sha256` and pushes a commit here.

So this repo's commit history doubles as a release timeline for the Mac path specifically.
