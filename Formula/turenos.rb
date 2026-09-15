class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.21/forge-darwin-arm64.zip"
      sha256 "5f706be73ebcf9cd0ac96daf113b9247d8a13025d3eab2f03791fecfb5cb26ad"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.21/forge-darwin-x64-baseline.zip"
      sha256 "ddd013b26eddece187625474226c8cb292626ba0a1e537863fe1e6a7731d1c01"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.21/forge-linux-arm64.tar.gz"
      sha256 "4b382107a3e8000fbde5d7ed8e5d98e801247c0acaa65e2adbe2a76bec5226de"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.21/forge-linux-x64-baseline.tar.gz"
      sha256 "2cb826f2f2316f8ab44a2fae29a212ca6882e203e1acdb03199e71ed8d96ecfa"
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
