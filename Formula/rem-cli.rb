class RemCli < Formula
  desc "A CLI tool for TODO management"
  homepage "https://github.com/tttol/rem-cli"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-aarch64-apple-darwin.tar.gz"
      sha256 "11978a2983cea24aadcf885991a5c9fab66e56714b0febb17c777505d1f070a6"
    end
    on_intel do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-x86_64-apple-darwin.tar.gz"
      sha256 "fe0d044a386f03760104cb936cb666dcffbb2db1561c0599e9d369ce1b987dcd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0014d203ed2ea8c6751f9726a527201b34cded8c1f5d69425bf0be2160f9f075"
    end
    on_intel do
      url "https://github.com/tttol/rem-cli/releases/download/v#{version}/rem-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a1cd7ecd7c549724fa059c9e01f9d4db2e4ca2d8ac782b0d4028ab339acfc0e1"
    end
  end

  def install
    bin.install "rem"
  end

  test do
    assert_match "View IAM policies", shell_output("#{bin}/rem-cli --help")
  end
end
