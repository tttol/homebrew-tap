class Canido < Formula
  desc "A CLI tool to view IAM policies attached to the current AWS role"
  homepage "https://github.com/tttol/canido"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tttol/canido/releases/download/v#{version}/canido-aarch64-apple-darwin.tar.gz"
      sha256 "ここにSHA256を貼り付け"
    end
    on_intel do
      url "https://github.com/tttol/canido/releases/download/v#{version}/canido-x86_64-apple-darwin.tar.gz"
      sha256 "ここにSHA256を貼り付け"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tttol/canido/releases/download/v#{version}/canido-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ここにSHA256を貼り付け"
    end
    on_intel do
      url "https://github.com/tttol/canido/releases/download/v#{version}/canido-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ここにSHA256を貼り付け"
    end
  end

  def install
    bin.install "canido"
  end

  test do
    assert_match "View IAM policies", shell_output("#{bin}/canido --help")
  end
end
