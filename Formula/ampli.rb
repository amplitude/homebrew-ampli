class Ampli < Formula
  desc "The Ampli CLI"
  homepage "https://amplitude.com"
  url "https://github.com/amplitude/homebrew-ampli/releases/download/v1.36.7/ampli-v1.36.7.tar.gz"
  version "1.36.7"
  sha256 "7a9b20a63ba03c448c5a1cea2faeb86a4fd13de5f217b8f7a23e31a28599c5d2"
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
