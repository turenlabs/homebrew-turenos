class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.39/forge-darwin-arm64.zip"
      sha256 "0ed777501cb958e316cfd83e164581e88d928f93d6de013b2d4d5edae8f5315f"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.39/forge-darwin-x64-baseline.zip"
      sha256 "a99027ecd852daea8ef229b8594fc79bcbf8ccfeb88d0212652523b44da9bcfc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.39/forge-linux-arm64.tar.gz"
      sha256 "2a9dcb2655b0d329aca331e72c6a77dd79b221c574eef9970fc355da6be3df87"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.39/forge-linux-x64-baseline.tar.gz"
      sha256 "f15e74d499aeb807a610c0d8d4c2ab3186e445f7d93db046818944e7c3853622"
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
