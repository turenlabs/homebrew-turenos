class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.31/forge-darwin-arm64.zip"
      sha256 "e8cfe14e993c5fae04132cfaeb8e7b94f1c4896013f4181e6c4f3535bdf167f8"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.31/forge-darwin-x64-baseline.zip"
      sha256 "774797f420310639effa57d2d92de5e813f5f3f97ab3daafc184f5f3a2635b40"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.31/forge-linux-arm64.tar.gz"
      sha256 "7e00748293a4aced9711b2a1c0eb14a8409bfee60fdae847d42ba76708100eef"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.31/forge-linux-x64-baseline.tar.gz"
      sha256 "e7c7a6527ec3a6d29196e0f48e5689b69149cf4ac53ed50ab569d96c432067f3"
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
