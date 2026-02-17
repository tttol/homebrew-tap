class RemCli < Formula
  desc "A CLI tool for TODO management"
  homepage "https://github.com/tttol/rem-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-aarch64-apple-darwin.tar.gz"
      sha256 "cd71958c49d58de1b5ba630a44cc5a837331687063734ac083ff7932c7b9af02"
    end
    on_intel do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-x86_64-apple-darwin.tar.gz"
      sha256 "979fc7a4d09f5c7e00aeab6cefbad54db82ea3074b9ca331d163d25230697c55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1c4f737882d1a063685e9b549750c0a17c1bf01a450dd5d9b3cf15380ecdcee5"
    end
    on_intel do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3fde503935d92d40e15fbd49a37541172debdacc1312207768dde2ac65747522"
    end
  end

  def install
    bin.install "rem-cli"
  end

  test do
    assert_match "View IAM policies", shell_output("#{bin}/rem-cli --help")
  end
end
