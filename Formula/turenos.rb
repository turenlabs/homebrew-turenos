class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.18/forge-darwin-arm64.zip"
      sha256 "02b0738e8a20726a39591ba4ebdbf2db63be83f95cada093ab52f969942a09d0"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.18/forge-darwin-x64-baseline.zip"
      sha256 "2476692b7ac800f581ad527861bc09ec1408a7f7b1ef176597310939325455cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.18/forge-linux-arm64.tar.gz"
      sha256 "6144eb039984b227221fff51c115f24a0f21b0c837a2f2331cf1ce80adf7c248"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.18/forge-linux-x64-baseline.tar.gz"
      sha256 "8d9f269827bc33ba8753bb98fdbfb38fc0026f9542cf851927c340fe52665252"
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
