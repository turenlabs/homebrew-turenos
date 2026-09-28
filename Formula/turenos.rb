class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.32/forge-darwin-arm64.zip"
      sha256 "38bb27922e8c25b990d4ed16b5837179e28131257fc376e73a88acaabe6ad241"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.32/forge-darwin-x64-baseline.zip"
      sha256 "6d025b3d4e9449bf6d2ebba3fde174ffca07d0ef95df1cde5e3a71f06ccfceaa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.32/forge-linux-arm64.tar.gz"
      sha256 "d6312eab3e391a57b5fc554e28b8d2ddf2c489c23441fab3c8e9d777e83612f8"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.32/forge-linux-x64-baseline.tar.gz"
      sha256 "cdecee960c8bbfaa7a11c0965bd1a1b58167fafd485b3b3cc12ebb75346e818e"
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
