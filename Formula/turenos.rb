class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.19/forge-darwin-arm64.zip"
      sha256 "38921bb5337af4e390ae5dcbcc18150a8a252bd6abcfd800eb35acdbace82960"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.19/forge-darwin-x64-baseline.zip"
      sha256 "6c51c932ba232803957b35010ac490498f02094a42b5b03f77ff2be8b6e5251c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.19/forge-linux-arm64.tar.gz"
      sha256 "4f65f6c96eb7af4c923228e618f07a4e5b9cdb0a1d1bdea27653aad1a3f125f9"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.19/forge-linux-x64-baseline.tar.gz"
      sha256 "a5e7a90c03a504a71350c4d7e3934c8eb8070c1fa0e4aba9f625c9b4e08d9461"
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
