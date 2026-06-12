class RemCli < Formula
  desc "A CLI tool for TODO management"
  homepage "https://github.com/tttol/rem-cli"
  version "1.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-aarch64-apple-darwin.tar.gz"
      sha256 "3d26133bc7d75052d96c380087634041d1118906d497df754d8ead7537cd6676"
    end
    on_intel do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-x86_64-apple-darwin.tar.gz"
      sha256 "b0790d5c2d85ed95501ab8411c8953a7d7d875fb2369c439a9b37c5300b1f162"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f7bc2cec638dd540e9f0830869cf318ed20628bf248d5928941a333010a504f2"
    end
    on_intel do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9323534a417d46593b0b9dd53c45475f7588a84ccb842a3c09d6dc1bed31c553"
    end
  end

  def install
    bin.install "rem"
  end

  test do
    assert_match "View IAM policies", shell_output("#{bin}/rem-cli --help")
  end
end
