class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.47/forge-darwin-arm64.zip"
      sha256 "1f847f6daa4f76311ee39741c8a74a0a96948d8d81350ae1dc126bd34e979ed3"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.47/forge-darwin-x64-baseline.zip"
      sha256 "eb0e6e93f25f782381d14ff973c99351281f3c93baf38d98b8c0478db504588c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.47/forge-linux-arm64.tar.gz"
      sha256 "415bbc4d5d487c6b460f24234bfe115f790c357c0a759e3b87c1c3b23eb44e91"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.47/forge-linux-x64-baseline.tar.gz"
      sha256 "2fe34d920bb650e2da11f406da3a16f2aa468568c14b78520ff8168462653ce5"
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
