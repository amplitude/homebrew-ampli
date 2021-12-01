class AmpliDev < Formula
  desc "The Ampli CLI (Dev)"
  homepage "https://amplitude.com"
  url "https://github.com/amplitude/homebrew-ampli/releases/download/v1.1.2-master-20211201041244.0/ampli-v1.1.2-master-20211201041244.0.tar.gz"
  version "1.1.2-master-20211201041244.0"
  sha256 "597477e03d555b16c1a73293b8d195602c3c9b137fec9055c4e68d4b8969e014"

  depends_on "node@12"

  def install
    inreplace "bin/ampli", /^CLIENT_HOME=/, "export AMPLI_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/ampli", "\"$DIR/node\"", "#{Formula["node@12"].bin}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/ampli" => "ampli-dev"
  end

  test do
    system bin/"ampli-dev", "version"
  end
end
