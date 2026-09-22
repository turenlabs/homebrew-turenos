class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.28/forge-darwin-arm64.zip"
      sha256 "b19b2d3657f462254d230c4aec5ee4be8d90857c7d846d6884006e44aa2703b9"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.28/forge-darwin-x64-baseline.zip"
      sha256 "85fec9a96ee1dfe5bb0c0dbdf6f9ee0078eff361b12df2f0d568072412fc3905"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.28/forge-linux-arm64.tar.gz"
      sha256 "4483091d4678f66c401c8ba8e376bcb54d3b3c68347b7c5a97ad750a172c2a30"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.28/forge-linux-x64-baseline.tar.gz"
      sha256 "f5613226a1695859f23929ede122a58f5c32ce7c69cf6f140fbd931c91d84460"
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
