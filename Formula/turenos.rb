class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.33/forge-darwin-arm64.zip"
      sha256 "8057c8f5f2c02f9bb51314cb6dc35fa0e90f5f01f54e188d23ec61b5efe2159b"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.33/forge-darwin-x64-baseline.zip"
      sha256 "b168b05b7ab598542ff4cb0b9ec09cb0e987eded5807bf95db227962a4972757"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.33/forge-linux-arm64.tar.gz"
      sha256 "ee705c282e518ee386071ce1e7a50c5bb370d7f9eb1c557eb096d8912a9d8ee3"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.33/forge-linux-x64-baseline.tar.gz"
      sha256 "0b156db6780f639b7de18c78e395690631e5f9e1fba6626794362b57ed7a081a"
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
