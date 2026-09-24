class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.29/forge-darwin-arm64.zip"
      sha256 "15ccb70b5dc299cb3e7efb9152a0dfb32a9f742821e12193ffa0709bacd8cc1e"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.29/forge-darwin-x64-baseline.zip"
      sha256 "02830bb0236ca3dfce6e7b435feadffff537315eb4c51fcebb0f29ce144861a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.29/forge-linux-arm64.tar.gz"
      sha256 "6d95df4d4b844b241309469038b5a209069b74de88c389984635e91d397380dc"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.29/forge-linux-x64-baseline.tar.gz"
      sha256 "ae51972a7f9c1a44851923363012638127117bc9c79d4ccebf1eb02c25e7f18c"
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
