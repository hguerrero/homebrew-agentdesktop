cask "agentdesktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.6.0"
  sha256 arm:   "5bc4da5ef06597ccac1375e0ee10a1e2a8f0dddc8641fe00410c9f7b36af26c8",
         intel: "63d7dd9ce6b33300f81a8a154a04907ae2fedd8f8abe478e599559aa56076f41"

  url "https://github.com/agentdesktop-dev/agentdesktop/releases/download/v#{version}/agentdesktop-macos-#{arch}.pkg"
  name "Agentdesktop"
  desc "Visibility and management layer for AI tools across a desktop fleet"
  homepage "https://agentdesktop.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  pkg "agentdesktop-macos-#{arch}.pkg"
  binary "#{appdir}/agentdesktop.app/Contents/MacOS/agentdesktop"

  uninstall launchctl: "dev.agentdesktop.daemon",
            quit:      "dev.agentdesktop.tray",
            pkgutil:   "dev.agentdesktop.installer"

  zap trash: [
    "/etc/agentdesktop",
    "/var/lib/agentdesktop",
  ]
end
