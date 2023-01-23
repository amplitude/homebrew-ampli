class AmpliDev < Formula
  desc "The Ampli CLI (Dev)"
  homepage "https://amplitude.com"
  url "https://github.com/amplitude/homebrew-ampli/releases/download/v1.30.1-master-20230123162424.0/ampli-v1.30.1-master-20230123162424.0.tar.gz"
  version "1.30.1-master-20230123162424.0"
  sha256 "f6206451f5dc4043c13c37f7cb56b863073beae57ad8f543c97689014a9aee79"

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
