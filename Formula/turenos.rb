class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.49/forge-darwin-arm64.zip"
      sha256 "a9c97504409a2a86dd4a32861079ad57d6b46216d210fd6294b72372fda6217b"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.49/forge-darwin-x64-baseline.zip"
      sha256 "eb04d3f63c00f43d49ddd7e195d3a4f8622974a8b7806dc8fcaa188ba1c9e94c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.49/forge-linux-arm64.tar.gz"
      sha256 "21fbe185f84a253a72dee2760b4719c6e9f6209e022f63cbef6b074008992e78"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.49/forge-linux-x64-baseline.tar.gz"
      sha256 "b66599d40b9031c36ee0d5c4cdfdc6e67899cd5386af3219164657323c363a50"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec / "forge"
    bin.install_symlink "forge" => "turenos"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/turenos --version")
  end
end
