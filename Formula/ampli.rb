class Ampli < Formula
  desc "The Ampli CLI"
  homepage "https://amplitude.com"
  url "https://github.com/amplitude/homebrew-ampli/releases/download/v1.36.6/ampli-v1.36.6.tar.gz"
  version "1.36.6"
  sha256 "7f60540d62db2d45848db0d6d48589577bc82309c155cb105a18dbf1f7c5d448"
  revision 1

  depends_on "node@26"

  def install
    inreplace "bin/ampli", /^CLIENT_HOME=/, "export AMPLI_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/ampli", "\"$DIR/node\"", "#{Formula["node@26"].bin}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/ampli" => "ampli"
  end

  test do
    system bin/"ampli", "version"
  end
end
