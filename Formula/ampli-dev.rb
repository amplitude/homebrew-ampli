class AmpliDev < Formula
  desc "The Ampli CLI (Dev)"
  homepage "https://amplitude.com"
  url "https://github.com/amplitude/homebrew-ampli/releases/download/v0.2.4-master-20211109164428.0/ampli-v0.2.4-master-20211109164428.0.tar.gz"
  version "0.2.4-master-20211109164428.0"
  sha256 "7702b2db2c553e8034a9000b231600076b4276eb97c91ad49d99830f01fcbbbe"

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
