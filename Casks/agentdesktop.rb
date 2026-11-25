cask "agentdesktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.7.0"
  sha256 arm:   "5f3a539ae07211a8337272e2ca596786bfcce6086d247e652dfc7c6e2a74338f",
         intel: "d543dcf6be3fd737dc5b9aba5778e116ff7f9766b4f6bb97f813703f53428419"

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
