class Sitesaver < Formula
  desc "Save readable web page content as Markdown"
  homepage "https://github.com/tttol/sitesaver"
  url "https://github.com/tttol/sitesaver/archive/refs/tags/0.1.0.tar.gz"
  sha256 "1b342a5fad6074f0b1ce8759c6666a5ed9e0d8f8750d75386c98fe68e8772587"
  license "MIT"
  depends_on "rust" => :build
  def install
    system "cargo", "install", "--locked", *std_cargo_args
  end
  test do
    assert_match "Save readable web page content as Markdown", shell_output("#{bin}/sitesaver --help")
  end
end
