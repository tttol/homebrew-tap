class RemCli < Formula
  desc "A CLI tool for TODO management"
  homepage "https://github.com/tttol/rem-cli"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-aarch64-apple-darwin.tar.gz"
      sha256 "ef25e5176e9b05d0db6fb2e2a27620619ce356ee132767bcc8d0a49394b28837"
    end
    on_intel do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-x86_64-apple-darwin.tar.gz"
      sha256 "271cf068647e67c941d651269a7a869fa10af0f5ca9b5361cc074663239defa7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bbdc589ec036b45396ee3dd986a5b838be5dce052d78c71feabc721a7f9bf5fa"
    end
    on_intel do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "37df9ad3f9b1999fedda099ecb583d5847d82c5953cb930a29e14a1a96f3e1c7"
    end
  end

  def install
    bin.install "rem"
  end

  test do
    assert_match "View IAM policies", shell_output("#{bin}/rem-cli --help")
  end
end
