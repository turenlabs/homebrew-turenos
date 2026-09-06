class Turenos < Formula
  desc "Batteries-included security engineering workbench"
  homepage "https://github.com/turenlabs/turenos"
  version "1.0.8"
  license "MIT"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/turenlabs/turenos/releases/download/v#{version}/forge-darwin-arm64.zip"
      sha256 "3fcfe7a7c8bf54d198a72fffc8a52a8ba3ede5193b44cf3bb00a45bedbf8a4ff"
    end
    on_intel do
      url "https://github.com/turenlabs/turenos/releases/download/v#{version}/forge-darwin-x64-baseline.zip"
      sha256 "a97ad096c498992665bf2161b7ed07dc108219ac5c23279234a73ac02d8038f2"
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
