class AmpliDev < Formula
  desc "The Ampli CLI (Dev)"
  homepage "https://amplitude.com"
  url "https://github.com/amplitude/homebrew-ampli/releases/download/v1.27.2-master-20221103031411.0/ampli-v1.27.2-master-20221103031411.0.tar.gz"
  version "1.27.2-master-20221103031411.0"
  sha256 "37a418c711e711e6693d75eb2282297d1ab0d559f85dd803f3aa8a3cc7a4daac"

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
