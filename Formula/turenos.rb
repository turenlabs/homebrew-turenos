class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.26/forge-darwin-arm64.zip"
      sha256 "748727d0877e39fb213014e0ac8d6455370addaedbd18a4958c9eed8ce05dd08"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.26/forge-darwin-x64-baseline.zip"
      sha256 "687cabdd488677a9d5d65d1de08ad1803b251795cd6b1d4f33da87acfddf17fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.26/forge-linux-arm64.tar.gz"
      sha256 "9666adc9e91a3036eed4ffc8a59e7a2d27cf88d865fd254ab8090b6cc2c527ba"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.26/forge-linux-x64-baseline.tar.gz"
      sha256 "ab97b16e534f679cc491fcf6ab7c9778cd3df8a75ec3551b22098e30498934f2"
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
