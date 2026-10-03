class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.40/forge-darwin-arm64.zip"
      sha256 "ccc7e3fed7775b0c7b81b7ca8b39e0ce4cbb69477364ec90b363f8ef63776f6e"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.40/forge-darwin-x64-baseline.zip"
      sha256 "513d48041a5cbe180b98b92d042fac3cd2266b107c6f7e625a642234aa8b7c8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.40/forge-linux-arm64.tar.gz"
      sha256 "2f84ba40d637569e8d06d4030a94e8bf7b6cd35ada2c1092de7333ddd7e85a64"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.40/forge-linux-x64-baseline.tar.gz"
      sha256 "0502d944fcba5387ace3647110e01fc21fbdae938656c22e041735be1febd5ec"
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
