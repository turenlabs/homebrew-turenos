class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.51/forge-darwin-arm64.zip"
      sha256 "f201a45b66beab6f813d05d211a5afe15a25ba90a3bfcbb9ac05adeee0379f76"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.51/forge-darwin-x64-baseline.zip"
      sha256 "934787fb5f0cd27d944b3258890de6be78e10afbeeb83d873af72ed57d00ae47"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.51/forge-linux-arm64.tar.gz"
      sha256 "21cf0534e5ac2edeaa3fc065b67335566e7c79197c491d78287ae61f7b167d44"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.51/forge-linux-x64-baseline.tar.gz"
      sha256 "0195a952961c6cc3c583756137906b6e1194db416698298ab678d03f9cff0b18"
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
