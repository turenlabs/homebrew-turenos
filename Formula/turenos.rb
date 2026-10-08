class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.43/forge-darwin-arm64.zip"
      sha256 "1c91f00ada1cf9a19e87827e8a0490e3dd5c1e197d837b248a459fa109ed1bf5"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.43/forge-darwin-x64-baseline.zip"
      sha256 "83d3c8910ea092dad511b7166bd6ff6d04102d17130c31d086e0c32374d85c1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.43/forge-linux-arm64.tar.gz"
      sha256 "153a30ea3adedf79e042e2c6c00a3eccfbfd9a17c459c5e5f0972ca5f1d596f9"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.43/forge-linux-x64-baseline.tar.gz"
      sha256 "e5c3e852929e2f9171e85b0a1afe03ef42038bd144c6e2d5d3c2d4efef291d5f"
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
