class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.50/forge-darwin-arm64.zip"
      sha256 "e9ee2e4447ed93ae7173f5d7170a877c5571687f0d7c6b21bacfaa6e676e3ac8"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.50/forge-darwin-x64-baseline.zip"
      sha256 "8f0af9bdd60ab3953d98183f2c07f56773b4f1c5dd406aa94334a13e1e98bfb8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.50/forge-linux-arm64.tar.gz"
      sha256 "3c5d18d0eaf0c79f2daa3c6d5592030ab3ba71d4bdd3f5b09a46cb1843fb4179"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.50/forge-linux-x64-baseline.tar.gz"
      sha256 "1eae5e0eb5da53f8ec50a9f429100a5db29c8798e335bdf467e5325d7755081b"
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
