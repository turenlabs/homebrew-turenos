class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.45/forge-darwin-arm64.zip"
      sha256 "d417cee95eeff8afa6d9565fe3099673e333b36d5596fb6ea267905052c5f85c"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.45/forge-darwin-x64-baseline.zip"
      sha256 "4bae80b9ed8cbb82f2128a0ac0384e75fb57b95e1702a30e7ed39d6a77bd0cc9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.45/forge-linux-arm64.tar.gz"
      sha256 "3470a52bc5924e486911156f4cbe6a45ed4e02f18233872b8aab7d8f28820713"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.45/forge-linux-x64-baseline.tar.gz"
      sha256 "5409ec757c7e96553ace1254591d4a2b657760b1b3d33a50b2c2bd6b5831d4b1"
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
