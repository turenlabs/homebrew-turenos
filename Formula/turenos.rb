class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.12/forge-darwin-arm64.zip"
      sha256 "20156f1da736ea53eb47a5d0c49ee811319bedca2409070b57727b69f00b7a72"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.12/forge-darwin-x64-baseline.zip"
      sha256 "5e42f4a57bc1c037b6a010641365a2a1f5552f3e72b5c80c97e4abaad06babb9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.12/forge-linux-arm64.tar.gz"
      sha256 "37bb136cd7dd326e05794f1aa07ad20c5469394762aea4addc494ad79027225a"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.12/forge-linux-x64-baseline.tar.gz"
      sha256 "580cae5379fec237d6e9fe9b0a98b98e431adefbd01dc26085ab7dbf4e649c8f"
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
