class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.44/forge-darwin-arm64.zip"
      sha256 "ddad17c046da3fa5959f7915f2a2d0b41f8d748c059c1375d9b8b5a13dacccc3"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.44/forge-darwin-x64-baseline.zip"
      sha256 "20794aedd3a66fccaca97595b7f7127f4c5d5521227f9e23550efee4f4938400"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.44/forge-linux-arm64.tar.gz"
      sha256 "193884e786b02884f21810dadde231849e251f52af83df5364a4bd73c8255fdb"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.44/forge-linux-x64-baseline.tar.gz"
      sha256 "44489f8b4ad16b25abff1c7b3dee0128de2fa4f9ee8add226d566355b546ee83"
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
