class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.42/forge-darwin-arm64.zip"
      sha256 "2d04ad0e8df7d875e53cff9f74bd8836b2ffecc10d387c1f47b6f9e9d3fd5be9"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.42/forge-darwin-x64-baseline.zip"
      sha256 "8e0f8217f41d3a1dbfdc10b7605250c6ad3066b5f33d3f461fbb7677ff8d5ee7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.42/forge-linux-arm64.tar.gz"
      sha256 "b9987949e9bdcba42dc5ca7869e02abdb9e081ce8ec14ec73d211178839ad84d"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.42/forge-linux-x64-baseline.tar.gz"
      sha256 "104ba083bf0e7ed17916e915eb98bff19d795a39bf5fa6e715268ed224c7593e"
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
