cask "plyrium-echo" do
  version "1.0.14"
  sha256 "8c44eea21098edb4fc5e48a6b5a32e2a3f17a187a039d4adc46da7e3a0682c45"

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
