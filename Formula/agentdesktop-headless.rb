class AgentdesktopHeadless < Formula
  desc "Agentdesktop daemon and CLI without the desktop UI, for headless Linux hosts"
  homepage "https://agentdesktop.dev/"
  url "https://github.com/agentdesktop-dev/agentdesktop/releases/download/v0.6.0/agentdesktop-headless-linux-amd64"
  sha256 "e6c66f1a62ed91d36d60e219da69cf17dc00f68401a6e5f1712743f4e2952186"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :linux

  on_linux do
    on_arm do
      url "https://github.com/agentdesktop-dev/agentdesktop/releases/download/v0.6.0/agentdesktop-headless-linux-arm64"
      sha256 "068c4ee503540624c3a7f45fcff47a5dd34a8f122c7be8ad00c034d13789b0b6"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "agentdesktop-headless-linux-#{arch}" => "agentdesktop"
  end

  service do
    run [opt_bin/"agentdesktop", "daemon", "--user"]
    keep_alive successful_exit: false
    log_path var/"log/agentdesktop.log"
    error_log_path var/"log/agentdesktop.log"
  end

  def caveats
    <<~EOS
      The daemon does not start until ~/.config/agentdesktop/config.yaml exists.
      Start from the standalone example:
        mkdir -p ~/.config/agentdesktop
        curl -fL -o ~/.config/agentdesktop/config.yaml \\
          https://raw.githubusercontent.com/agentdesktop-dev/agentdesktop/main/examples/standalone/config.yaml

      Then run the daemon in the background with:
        brew services start #{name}
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentdesktop --version")
  end
end
