class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.35/forge-darwin-arm64.zip"
      sha256 "b533f7b995669e576d0d21673a988fc5e83e67ec9ef8fcec0521f2232b6a54f0"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.35/forge-darwin-x64-baseline.zip"
      sha256 "0c5e555a1d01134f4633bd3361c509fcb55d8bde15ff60494422007916fd1748"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.35/forge-linux-arm64.tar.gz"
      sha256 "c33d844cb282578f0a62226c36d8071a0b7e8b685ee8982d1cd1293246be0e1f"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.35/forge-linux-x64-baseline.tar.gz"
      sha256 "4729a9d26cf9fc2d9c4b8baf4714450a3f61a960ea0d161ee1abbaef7be6bf9d"
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
