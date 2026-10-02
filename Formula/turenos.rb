class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.38/forge-darwin-arm64.zip"
      sha256 "ef84c9330ffa8a51f53378a14df70cab208c9d224b3e01850ab4c005d3f87636"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.38/forge-darwin-x64-baseline.zip"
      sha256 "9f571fc2c53270a0c448d46a5f0d6b40cdb893d9908736f43536f214434cb341"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.38/forge-linux-arm64.tar.gz"
      sha256 "5655c661fdad317e85ad7c49dd81ffad38e75df3d39de2330e72ad2b03d24cde"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v1.0.38/forge-linux-x64-baseline.tar.gz"
      sha256 "cc742668895c7baec1b69d27d7148eaa906e17a8280c71dea71452e7dff29445"
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
