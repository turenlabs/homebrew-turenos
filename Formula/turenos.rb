class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.15/forge-darwin-arm64.zip"
      sha256 "c514e64d6b8b8f17068037db79d648218b098c430d85869ee7107013e81e026a"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.15/forge-darwin-x64-baseline.zip"
      sha256 "a916e1fb4296229064e4aa0906cacd2777a7d728a2277e02dc6a8d3e4d1495f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.15/forge-linux-arm64.tar.gz"
      sha256 "d4c686f8837eb733e4da5a26b8de6e9efb02d5349a37d2476d7813d6959451c5"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.15/forge-linux-x64-baseline.tar.gz"
      sha256 "0604afe3528de4be3dd6829895366a2448ce24c46503afb6dab57e12bad32eea"
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
