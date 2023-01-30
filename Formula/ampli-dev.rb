class AmpliDev < Formula
  desc "The Ampli CLI (Dev)"
  homepage "https://amplitude.com"
  url "https://github.com/amplitude/homebrew-ampli/releases/download/v1.30.2-master-20230130192151.0/ampli-v1.30.2-master-20230130192151.0.tar.gz"
  version "1.30.2-master-20230130192151.0"
  sha256 "18ef47b5184ca6ba946114270465631bf4475f583d6d3b86607b1f6a02d5d0ac"

  depends_on "node@18"

  def install
    inreplace "bin/ampli", /^CLIENT_HOME=/, "export AMPLI_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/ampli", "\"$DIR/node\"", "#{Formula["node@18"].bin}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/ampli" => "ampli-dev"
  end

  test do
    system bin/"ampli-dev", "version"
  end
end
