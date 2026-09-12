class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.16/forge-darwin-arm64.zip"
      sha256 "409d7beb8eb4837d4b557a235db7fbe7dc8589d05086b3b381b01ae175a7840e"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.16/forge-darwin-x64-baseline.zip"
      sha256 "c394ebb28490d2596341b1cbbf234088c10772a0d44c1a394cccac895e25f29f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.16/forge-linux-arm64.tar.gz"
      sha256 "b66a63a39ceb0dade8dc3a392169c376ae202a42d46764e05a1d544d9c79310b"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.16/forge-linux-x64-baseline.tar.gz"
      sha256 "e227be9d502bee95b87efc68af415fd81238ab7f604d779122e86e6f076660e8"
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
