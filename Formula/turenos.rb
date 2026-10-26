class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.48/forge-darwin-arm64.zip"
      sha256 "c01e8996544d9a3cd6430c14e712e0534f6b86664030a56d0666704fd9b217b8"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.48/forge-darwin-x64-baseline.zip"
      sha256 "91733cf227183770025ed968b9d61b104a0910ec58d26f3945b57825ab57b757"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.48/forge-linux-arm64.tar.gz"
      sha256 "588bf4f94a10af6ed68f62247674dd11aaa60d8bc621cfd51944f9e9fda31b02"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.48/forge-linux-x64-baseline.tar.gz"
      sha256 "54033da7ab60658cdf3bb64c2fd5172c042ba76c74b226bbc5e67c2bcc88e2b1"
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
