cask "plyrium-echo" do
  version "1.0.16"
  sha256 "d0f9ee4943b73e77d065ca2ab5d0cd885258eff00d3fd640604417a43267c9b7"

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
