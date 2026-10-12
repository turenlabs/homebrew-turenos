class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.46/forge-darwin-arm64.zip"
      sha256 "f797b3818707d0c06fceec18b4887bce3c187ba488939e783c7ea370f930ac7b"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.46/forge-darwin-x64-baseline.zip"
      sha256 "4f7ae14db9580b6380eda293039a5a164c641c80ef801efbb493bd1382d17b4f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.46/forge-linux-arm64.tar.gz"
      sha256 "90847fb5c94dfb2cc34602c010752e14005ad11bbcc693ae6969815b9446e263"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.46/forge-linux-x64-baseline.tar.gz"
      sha256 "72e47b2f6d088eec1fc525bf605554cae5c1fb4e6d7aa55634479c96e67d94dd"
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
