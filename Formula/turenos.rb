class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.30/forge-darwin-arm64.zip"
      sha256 "ee60cd872923b49189d2d1af3fa356278b0f3c629ab0502b656d2cdb133eaab8"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.30/forge-darwin-x64-baseline.zip"
      sha256 "2727175072627e76d03f8582297f28e184119831115188907902c25a183348ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.30/forge-linux-arm64.tar.gz"
      sha256 "f148265bf3caf8a2fc7f90e0740adb6c8af963b4d5ee0da7224a37a458b1534b"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.30/forge-linux-x64-baseline.tar.gz"
      sha256 "5c60ad475331896ab48d6635ebbb94101b6f24a44a931aa9f3e65a84b04f1764"
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
