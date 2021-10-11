class Ampli < Formula
  desc "The Ampli CLI"
  homepage "https://amplitude.com"
  url "https://github.com/amplitude/ampli/releases/download/latest/ampli-v0.1.1-master-20211011161049.0.tar.gz"
  version "0.1.1-master-20211011161049.0"
  sha256 "5794719c0967f248a3b1b6cfd135496f14cfd641e6fc4213884e8de1b43faf20"

  depends_on "node@12"

  def install
    inreplace "bin/ampli", /^CLIENT_HOME=/, "export AMPLI_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/ampli", "\"$DIR/node\"", "#{Formula["node@12"].bin}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/ampli" => "ampli"
  end

  test do
    system bin/"ampli", "version"
  end
end
