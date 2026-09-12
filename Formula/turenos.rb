class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.17/forge-darwin-arm64.zip"
      sha256 "edb22ea17dca1c433c56fcb0dc452b51c175a2a846512b6887c7358517a437c8"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.17/forge-darwin-x64-baseline.zip"
      sha256 "16b91124d808efa8aa23ee981ae71da06caf48297ce9d6faa4e1d0b4142afd71"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.17/forge-linux-arm64.tar.gz"
      sha256 "073ab287f91d48f27e4bccec1afe0c26b0218eea24f9d5bdcff2bf8d6665637a"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.17/forge-linux-x64-baseline.tar.gz"
      sha256 "09734ea66c31eba183abe929e31d70dfd85d350492e9ee2f96650b30bc8a77c1"
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
