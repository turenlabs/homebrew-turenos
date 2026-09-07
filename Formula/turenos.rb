class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.11/forge-darwin-arm64.zip"
      sha256 "7c70899404e393eb8e8eb4dbf55188f356f383e2447dbb0f776a30681f84b367"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.11/forge-darwin-x64-baseline.zip"
      sha256 "680963038eb493990d61cb3c7de22bebd19a4903a8e6ab1330f317cbf225744d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.11/forge-linux-arm64.tar.gz"
      sha256 "0c2bb73b01c205dc6d8dedfeed10548fbbdb70ff02793bea99fe197cf7955cb6"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.11/forge-linux-x64-baseline.tar.gz"
      sha256 "4e443896565f97bb5da68ce8518a322b01a0bc61782be6d73821546761e4bba8"
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
