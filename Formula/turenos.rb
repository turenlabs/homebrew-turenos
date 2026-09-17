class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.23/forge-darwin-arm64.zip"
      sha256 "55847ccf751659c716ef065ec080b2dd5bba4fc605030241d7d3c200c1776504"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.23/forge-darwin-x64-baseline.zip"
      sha256 "dc909d3fba7d6fcd838a8cc644cad461206eeea4cd209fae4a69beb2063450de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.23/forge-linux-arm64.tar.gz"
      sha256 "f29ad5406d4f4291c02feadf7c135e61f9f6d18c911cb6b7b114b0c00c0b104f"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.23/forge-linux-x64-baseline.tar.gz"
      sha256 "9a738bb6b876687c5c5b3117b1f846e3bb58e74f335afccd6c2c1791a33689a2"
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
