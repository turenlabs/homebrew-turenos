class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.10/forge-darwin-arm64.zip"
      sha256 "5a7d1a3251e9d180a055747d89699783e891929cd22ab63864b603dc2de5ec52"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.10/forge-darwin-x64-baseline.zip"
      sha256 "1047a4a761961976a034a1d9297da0db9ca2ff884afc4d6408d1b61ac486ae5d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.10/forge-linux-arm64.tar.gz"
      sha256 "c57b5da937bcb86983aac80d6e18e9182087462169543e82017279410ec27aab"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.10/forge-linux-x64-baseline.tar.gz"
      sha256 "00a5e56991454bcb8859bc887d76e15d094057a76b60a8efac6cd3f732a376d6"
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
