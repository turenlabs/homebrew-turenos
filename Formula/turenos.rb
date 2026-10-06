class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.41/forge-darwin-arm64.zip"
      sha256 "ede5b906442dd92df4134d0b69304594fc0d951e973aa6fcfba71ec3e5e8007d"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.41/forge-darwin-x64-baseline.zip"
      sha256 "6bf71f2dd1303a169192b0549eed2c8a17a772e071629775bcca7556fc50d392"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.41/forge-linux-arm64.tar.gz"
      sha256 "2a453de4bea9b08bdecdee5f19b3a427362f644a448cb63f4bb04b0237012b80"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.41/forge-linux-x64-baseline.tar.gz"
      sha256 "6aba802f5505c92abb142f533d58778b281867c9b4c31fc8bba170624f5c71a0"
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
