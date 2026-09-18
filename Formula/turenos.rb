class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.27/forge-darwin-arm64.zip"
      sha256 "71aac7d6890908da007a28bff590daabb34295ac61fc8f91924ee3c768c239a3"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.27/forge-darwin-x64-baseline.zip"
      sha256 "078f2c9b7ae4441d8a32f83ca83a1e9d28a6d3ed04534f1a894f8920d989d15c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.27/forge-linux-arm64.tar.gz"
      sha256 "04501898bfee5db7105f5105b4c7f0307fe1fb7371917ccfdb9b573e1c1f02c7"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.27/forge-linux-x64-baseline.tar.gz"
      sha256 "04561a75f9ed4c00755a11cff6dccd6366c5f34a923617107cf7f0138621c458"
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
