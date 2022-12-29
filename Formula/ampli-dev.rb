class AmpliDev < Formula
  desc "The Ampli CLI (Dev)"
  homepage "https://amplitude.com"
  url "https://github.com/amplitude/homebrew-ampli/releases/download/v1.29.1-master-20221229181130.0/ampli-v1.29.1-master-20221229181130.0.tar.gz"
  version "1.29.1-master-20221229181130.0"
  sha256 "e8aea0aa8a7aced1bb9192682027a36e4f47188cdaaf62f2a2bb83fe7d99ea14"

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
