class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.20/forge-darwin-arm64.zip"
      sha256 "2f871be69549ea022ed094aa8f6adf0ac78b29bf29b38936f8bb977693225216"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.20/forge-darwin-x64-baseline.zip"
      sha256 "5eae411febb263a68fb662ccff714de693ad34a45505545687ba974c26de853d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.20/forge-linux-arm64.tar.gz"
      sha256 "180a8203c02ffc6e2f3f2d258b6b8fdec1c3d14811ad17d8d620e022a44e70d4"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.20/forge-linux-x64-baseline.tar.gz"
      sha256 "72a91bf137c3b2902436362fc0440b0c3ef22576cdcf631cc10948a1d1693585"
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
