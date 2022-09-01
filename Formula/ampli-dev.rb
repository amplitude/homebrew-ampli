class AmpliDev < Formula
  desc "The Ampli CLI (Dev)"
  homepage "https://amplitude.com"
  url "https://github.com/amplitude/homebrew-ampli/releases/download/v1.20.1-master-20220901173416.0/ampli-v1.20.1-master-20220901173416.0.tar.gz"
  version "1.20.1-master-20220901173416.0"
  sha256 "25ef42bf4c733a76237aea583cabc1b52f7ed061cc78c0fffe5cfa5f04f26308"

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
