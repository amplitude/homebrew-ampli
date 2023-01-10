class AmpliDev < Formula
  desc "The Ampli CLI (Dev)"
  homepage "https://amplitude.com"
  url "https://github.com/amplitude/homebrew-ampli/releases/download/v1.29.1-master-20230110184012.0/ampli-v1.29.1-master-20230110184012.0.tar.gz"
  version "1.29.1-master-20230110184012.0"
  sha256 "f380319a23226cb022e9741f071fc5523c5f990ed364b0c077f5a6684714508a"

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
