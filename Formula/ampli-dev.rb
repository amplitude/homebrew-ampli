class AmpliDev < Formula
  desc "The Ampli CLI (Dev)"
  homepage "https://amplitude.com"
  url "https://github.com/amplitude/homebrew-ampli/releases/download/v1.8.1-master-20220426220938.0/ampli-v1.8.1-master-20220426220938.0.tar.gz"
  version "1.8.1-master-20220426220938.0"
  sha256 "07fa18e9aad2fc718ee929d5ba731e446ec09aaffa3ebec7d612410f148c0292"

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
