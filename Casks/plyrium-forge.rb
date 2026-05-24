cask "plyrium-forge" do
  version "1.2.0"
  sha256 "d353c2173e31ed9346b1bb3428f992f87550591df514242028ea08c7efd3cc88"

  url "https://github.com/mordiaky/plyrium-forge-releases/releases/download/v#{version}/Plyrium-Forge-Mac-arm64.zip"
  name "Plyrium Forge"
  desc "Multi-agent AI terminal orchestration for Claude, Codex, Gemini, OpenCode"
  homepage "https://forge.plyrium.com"

  # The version label on forge.plyrium.com is the source of truth; Homebrew's
  # `brew livecheck` walks the public mirror's /releases/latest endpoint to
  # detect new versions without us having to ping it on every release.
  livecheck do
    url "https://github.com/mordiaky/plyrium-forge-releases/releases/latest"
    strategy :github_latest
  end

  # arm64 (Apple Silicon) only for now. Intel Macs can run via Rosetta 2
  # but the Rust binaries inside will incur translation overhead. A
  # universal binary (lipo arm64 + x86_64) is a roadmap item once Intel
  # download volume justifies the build matrix expansion.
  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "Plyrium Forge.app"

  # Cleanup paths on `brew uninstall --zap`. Covers user data + caches
  # + system-managed state that the app writes outside its bundle.
  # Anything matching the appId in CFBundleIdentifier gets caught here.
  zap trash: [
    "~/Library/Application Support/Plyrium Forge",
    "~/Library/Caches/com.plyrium.forge",
    "~/Library/Caches/com.plyrium.forge.ShipIt",
    "~/Library/HTTPStorages/com.plyrium.forge",
    "~/Library/Logs/Plyrium Forge",
    "~/Library/Preferences/com.plyrium.forge.plist",
    "~/Library/Saved Application State/com.plyrium.forge.savedState",
    "~/Library/WebKit/com.plyrium.forge",
  ]

  # No code signing yet — Homebrew Cask strips the quarantine attribute
  # automatically on install via the `app` stanza handling, so users
  # never see the "developer cannot be verified" gate that direct .zip
  # downloads trigger. When/if Plyrium picks up an Apple Developer ID
  # Application cert, set `arch arm: "arm64", intel: "x86_64"` + add
  # `livecheck strategy :git` against signed releases.
end
