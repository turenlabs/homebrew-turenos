class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.34/forge-darwin-arm64.zip"
      sha256 "1ffc6741b2ffea61e260358af440df3701e62f48b521eefddb1adc76b2e707df"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.34/forge-darwin-x64-baseline.zip"
      sha256 "43c95de9b8d8ae3420fb21d11c88e55bba8eec1467a77d4d978b78595fc2ae52"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.34/forge-linux-arm64.tar.gz"
      sha256 "a82d810dcd3bc4c7e3ee33ee021785c8d575fdc206af140834b3c4bbd76f42c1"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.34/forge-linux-x64-baseline.tar.gz"
      sha256 "7b1c389cf90bd049bb6f935f1f5f9916fbf38ef5540cb48d78075425eec15736"
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
