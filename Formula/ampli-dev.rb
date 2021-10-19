class AmpliDev < Formula
  desc "The Ampli CLI (Dev)"
  homepage "https://amplitude.com"
  url "https://github.com/amplitude/homebrew-ampli/releases/download/v0.2.1-master-20211018153635.0/ampli-v0.2.1-master-20211018153635.0.tar.gz"
  version "0.2.1-master-20211018153635.0"
  sha256 "25a806270852dbcf990c63f8816aa1418b5b4b0c3fa0e95b0ec294575125b260"

  depends_on "amplitude/ampli/ampli-node-dev"

  def install
    inreplace "bin/ampli", /^CLIENT_HOME=/, "export AMPLI_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/ampli", "\"$DIR/node\"", "#{Formula["ampli-node-dev"].libexec}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/ampli" => "ampli-dev"
  end

  test do
    system bin/"ampli-dev", "version"
  end
end
