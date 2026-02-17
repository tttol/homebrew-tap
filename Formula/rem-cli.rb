class RemCli < Formula
  desc "A CLI tool for TODO management"
  homepage "https://github.com/tttol/rem-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-aarch64-apple-darwin.tar.gz"
      sha256 "534f36b047ff040b0fdfbdf26d8cd16afce966fe9b1d7c1a126ac4f0778de40b"
    end
    on_intel do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-x86_64-apple-darwin.tar.gz"
      sha256 "eeb3bea3fbb0315e6c962b7f89564c310ac3c960f30679c2dbe3683bb7c252bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "740b63d9b324b637dc1dbeba7e722324779acbd25b1045bb2ba2f50cff313630"
    end
    on_intel do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8f4533dfe63fbedf3b65ce4ab4902af9aec7fc9e38e6fdb435b961c987b0a8da"
    end
  end

  def install
    bin.install "rem-cli"
  end

  test do
    assert_match "View IAM policies", shell_output("#{bin}/rem-cli --help")
  end
end
