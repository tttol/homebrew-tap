class RemCli < Formula
  desc "A CLI tool for TODO management"
  homepage "https://github.com/tttol/rem-cli"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-aarch64-apple-darwin.tar.gz"
      sha256 "5c89d901fa04e34e4994dee0da87598cc403116c4948855917ad1fdbd493fc39"
    end
    on_intel do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-x86_64-apple-darwin.tar.gz"
      sha256 "df5764f252761406ef59715da774e121885636ec6584fa3dd4888c9b96678c28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4e777e33c796c0311d21e1ff05c5ea2a1c6c76ccb93ad4225758e2724789e65f"
    end
    on_intel do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eeb445c6d99fb7c30512362dfc019e6c63703dfab7f7886156951baaecf7ff63"
    end
  end

  def install
    bin.install "rem"
  end

  test do
    assert_match "View IAM policies", shell_output("#{bin}/rem-cli --help")
  end
end
