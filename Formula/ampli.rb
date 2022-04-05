class Ampli < Formula
  desc "The Ampli CLI"
  homepage "https://amplitude.com"
  url "https://github.com/amplitude/homebrew-ampli/releases/download/v1.6.0/ampli-v1.6.0.tar.gz"
  version "1.6.0"
  sha256 "aeaa161ccd0da6b12131f0f7641fe5c8253015105a9f762af545da7b6f031f3b"

  depends_on "node@12"

  def install
    inreplace "bin/ampli", /^CLIENT_HOME=/, "export AMPLI_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/ampli", "\"$DIR/node\"", "#{Formula["node@12"].bin}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/ampli" => "ampli"
  end

  test do
    system bin/"ampli", "version"
  end
end
