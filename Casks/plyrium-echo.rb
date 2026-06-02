cask "plyrium-echo" do
  version "1.0.6"
  sha256 "9f12322eaf02096a86cbb85cd5499a5ae00d026bfcfb45a84cfee9208a4af96f"

  url "https://github.com/mordiaky/plyrium-echo-releases/releases/download/v#{version}/Plyrium-Echo-macOS.zip"
  name "Plyrium Echo"
  desc "Private offline push-to-talk dictation"
  homepage "https://forge.plyrium.com/echo"

  livecheck do
    url "https://github.com/mordiaky/plyrium-echo-releases/releases/latest"
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  artifact "Plyrium Echo", target: "#{appdir}/Plyrium Echo"
  binary "#{appdir}/Plyrium Echo/Plyrium Echo", target: "plyrium-echo"

  zap trash: [
    "~/Library/Application Support/Plyrium Echo",
    "~/Library/Caches/Plyrium Echo",
    "~/Library/Logs/Plyrium Echo",
    "~/Library/Preferences/com.plyrium.echo.plist",
    "~/Library/Saved Application State/com.plyrium.echo.savedState",
  ]

  # Echo's current macOS artifact is an unsigned PyInstaller one-folder build,
  # not a .app bundle. Installing through Homebrew avoids the direct-download
  # quarantine flow; users can run `plyrium-echo` after install.
end
