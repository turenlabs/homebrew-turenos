class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.24/forge-darwin-arm64.zip"
      sha256 "69195ab0e5ba6bd0d0ee48a304b1b165897feea190bdc4aa424f07b75700ecb6"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.24/forge-darwin-x64-baseline.zip"
      sha256 "260ae2c41d7f9bc68e608b51f23a9f20237f01a6535ec9ae1a7990c354469a49"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.24/forge-linux-arm64.tar.gz"
      sha256 "c7667c6c7b653a7a8bf286e941337defdd43f2fc88aa01f36c169541a4a34e01"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.24/forge-linux-x64-baseline.tar.gz"
      sha256 "61fc094b70c0148023a8a5f72c0857c13cab5cc5ab81c5057556f742391969fc"
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
