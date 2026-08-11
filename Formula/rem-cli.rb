class RemCli < Formula
  desc "A CLI tool for TODO management"
  homepage "https://github.com/tttol/rem-cli"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-aarch64-apple-darwin.tar.gz"
      sha256 "9a550298a3af1d65ce7a88e47ac6a451167a8756a4af3f3fb879b45339dd3bbd"
    end
    on_intel do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-x86_64-apple-darwin.tar.gz"
      sha256 "e5f57f173e03f6758171fffd95db66770c92da867cf30d4d77c3fb6f643ddf75"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3d5ecd379b0184263c8d55370d6692e85db29922a66acc3b7090966091463374"
    end
    on_intel do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7afada41a0dd875b4e2c07932c6f52155058a9d9aad4d3c926d9700af9bc55a4"
    end
  end

  def install
    bin.install "rem"
  end

  test do
    assert_match "View IAM policies", shell_output("#{bin}/rem-cli --help")
  end
end
