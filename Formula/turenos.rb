class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.22/forge-darwin-arm64.zip"
      sha256 "8c198d2c85f5a8cbb5002187a48767caac9f8173abc10eab51637fb25234c491"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.22/forge-darwin-x64-baseline.zip"
      sha256 "1c21a732b5f34d6b20f1787cbbab50f90fac27e863387eb736f47c680cbdb434"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.22/forge-linux-arm64.tar.gz"
      sha256 "83e5c6bab8dafa1b0bd009a3336da030710d0edaaa2ee3490b94570283c9a58b"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.22/forge-linux-x64-baseline.tar.gz"
      sha256 "3e50bd3b142ae0ea28903146ed3e07e5fea6d5c51c248ca215287ccebea2daa7"
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
