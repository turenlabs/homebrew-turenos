class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.14/forge-darwin-arm64.zip"
      sha256 "005945ec55b0e9d5af2729cab13a0a023f59521e85a2bebf1aef7ba28540b7f0"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.14/forge-darwin-x64-baseline.zip"
      sha256 "ff49ac9d4f86acae830eca1858da31acc332906e66298e6667b228e612a626d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.14/forge-linux-arm64.tar.gz"
      sha256 "7c3af71a114c7e3491db96aa740100ad8c26c1362c09e103453af04a2e9b3a96"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.14/forge-linux-x64-baseline.tar.gz"
      sha256 "eb6b3bf3a959749e198dfd1072e943ad6b713c33e9d65cc7dca120d4c811740a"
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
