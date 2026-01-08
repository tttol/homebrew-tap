class Canido < Formula
  desc "A CLI tool to view IAM policies attached to the current AWS role"
  homepage "https://github.com/tttol/canido"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tttol/canido/releases/download/v#{version}/canido-aarch64-apple-darwin.tar.gz"
      sha256 "e0c6a1210645a4b6d01a267a6a0d2fa162efdc96a622eba68fb36a87a2f3be77"
    end
    on_intel do
      url "https://github.com/tttol/canido/releases/download/v#{version}/canido-x86_64-apple-darwin.tar.gz"
      sha256 "ff2d0adea025f7f9b22f06b77229bc1f8578e5582ef9fee628260fbef39a5bc5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tttol/canido/releases/download/v#{version}/canido-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "297faa13467f6415c186bf30aea6fa7c6432fa8e2548effaab92da121d48b72c"
    end
    on_intel do
      url "https://github.com/tttol/canido/releases/download/v#{version}/canido-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "31bc5cd05d86c63a4c30bcbcc7930c9e31659f999d0f72b8f2d00333c4e2f873"
    end
  end

  def install
    bin.install "canido"
  end

  test do
    assert_match "View IAM policies", shell_output("#{bin}/canido --help")
  end
end
