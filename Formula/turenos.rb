class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.37/forge-darwin-arm64.zip"
      sha256 "e24a58e8af1510ce370488a5a4448be590311d579d4c0ad6bccae944612c22ab"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.37/forge-darwin-x64-baseline.zip"
      sha256 "f98be32e41b06428d7f31280c2839b8bba3d6b1e8aa6381537bc604a272b19ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.37/forge-linux-arm64.tar.gz"
      sha256 "ff9db652a9e5e6f72148b276cb793561abc25e178dc272f43c22e4674f410cb4"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.37/forge-linux-x64-baseline.tar.gz"
      sha256 "b111bf51adef478eae23d14edd9bca30ad4be5e3832ee386fcd8e341bac35c7d"
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
