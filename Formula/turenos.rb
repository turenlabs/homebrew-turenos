class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.25/forge-darwin-arm64.zip"
      sha256 "68733ef1a4bd5ed8eaeaf00520c362b9526dcb2cec3cab7c843a7bbe59a5aa4e"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.25/forge-darwin-x64-baseline.zip"
      sha256 "4b71322989752717fb27e4804748b2300e3242db12590173d14fb5d0257ac077"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.25/forge-linux-arm64.tar.gz"
      sha256 "de1212d308fcc87a0b6ec4e8f38c846d628352bbb8a919e40f772076f9411399"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.25/forge-linux-x64-baseline.tar.gz"
      sha256 "080d99c45a19634b0f7204eb5c22b2d40f12d975f025e61b248257cf8b0ead1f"
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
