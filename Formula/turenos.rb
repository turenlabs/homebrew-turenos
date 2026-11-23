class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.52/forge-darwin-arm64.zip"
      sha256 "39b6660c2c7e5aa617e7c65b36f70803250c6d850b868ed309feda987d5f1a60"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.52/forge-darwin-x64-baseline.zip"
      sha256 "b22fb797398cdb7e570d311aa4518620b8b673ed4f5157f5d3677544f439c7a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.52/forge-linux-arm64.tar.gz"
      sha256 "6a641d16a9c4b5c4ee6b6dae5a0964689b66b05cc993c412959325e208c0685c"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.52/forge-linux-x64-baseline.tar.gz"
      sha256 "2ac20af36559a30a1118ac03dc33b6fcdbe95d6db37a20a0cf5da642ba7d3754"
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
