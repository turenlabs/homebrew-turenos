class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.36/forge-darwin-arm64.zip"
      sha256 "cd315fd60368210289506645fd9ec030336c5b8996e5d03525f542dc2cd0cb5a"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.36/forge-darwin-x64-baseline.zip"
      sha256 "413e1e53bed389d91d77d71148b28bf89363dc8de4469d5f56bd6c10d1d55d57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.36/forge-linux-arm64.tar.gz"
      sha256 "cf985483e4e9659c7c00dfd47895563fa787b59fc4f47d61585e194601941f62"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.36/forge-linux-x64-baseline.tar.gz"
      sha256 "aac331a376ed258e2e544b3055be2b94546fe98050fa3c755e7f0b5b215966ff"
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
