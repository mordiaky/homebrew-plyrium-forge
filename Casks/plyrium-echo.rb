cask "plyrium-echo" do
  version "1.0.20"
  sha256 "b6a5a7af1c6d8063afc165ce8cafc78f3d84fa0384a769fd049b1ffbfafb95a2"

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

  app "Plyrium Echo.app"
  binary "#{appdir}/Plyrium Echo.app/Contents/MacOS/Plyrium Echo", target: "plyrium-echo"

  zap trash: [
    "~/Library/Application Support/Plyrium Echo",
    "~/Library/Caches/Plyrium Echo",
    "~/Library/Logs/Plyrium Echo",
    "~/Library/Preferences/com.plyrium.echo.plist",
    "~/Library/Saved Application State/com.plyrium.echo.savedState",
  ]

  # Echo ships as a PyInstaller .app bundle. Installing through Homebrew avoids
  # the direct-download quarantine flow; users can run `plyrium-echo` after install.
end
