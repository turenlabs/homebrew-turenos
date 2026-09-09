class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.13/forge-darwin-arm64.zip"
      sha256 "b3f23a3f557cc2c645c267dd786131e35a957f34e2bab4e2d16bd11a2df00b8a"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.13/forge-darwin-x64-baseline.zip"
      sha256 "8730344d5740b36ad3cb64835d031234e4fcfa8b40e52416b3235ae7ad1c8f74"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.13/forge-linux-arm64.tar.gz"
      sha256 "d13b06b264ff1771cd8df3a1333e8a57a302b466e1aa8bd5916de29146d8635c"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.13/forge-linux-x64-baseline.tar.gz"
      sha256 "384ef8822996e7d77723a75550377034f89eb7f8eeeb0b35f421f44e03639a72"
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
