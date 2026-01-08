class Canido < Formula
  desc "A CLI tool to view IAM policies attached to the current AWS role"
  homepage "https://github.com/tttol/canido"
  version "0.1.0-rc2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tttol/canido/releases/download/v#{version}/canido-aarch64-apple-darwin.tar.gz"
      sha256 "13852b15b1efdc3b9d037f0078a541d8eb3502e097a812121977a975e7e8cff7"
    end
    on_intel do
      url "https://github.com/tttol/canido/releases/download/v#{version}/canido-x86_64-apple-darwin.tar.gz"
      sha256 "4fd82154822ada9b049da455b7537066bdd0f662869ebe770c4d07c2359f7783"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tttol/canido/releases/download/v#{version}/canido-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "54a21afce687bb6172109755174a218a4de049356ab39fd92c1cc20b71acdef4"
    end
    on_intel do
      url "https://github.com/tttol/canido/releases/download/v#{version}/canido-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6224b74846760531ab28cf2b6083e296cd4ccf3849db6e3f2b7f2eec849c0d22"
    end
  end

  def install
    bin.install "canido"
  end

  test do
    assert_match "View IAM policies", shell_output("#{bin}/canido --help")
  end
end
