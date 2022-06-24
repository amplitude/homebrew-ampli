class AmpliDev < Formula
  desc "The Ampli CLI (Dev)"
  homepage "https://amplitude.com"
  url "https://github.com/amplitude/homebrew-ampli/releases/download/v1.11.1-master-20220624184249.0/ampli-v1.11.1-master-20220624184249.0.tar.gz"
  version "1.11.1-master-20220624184249.0"
  sha256 "cf27f6c7f03be8010c1df031238cacf4493ac8e0b5ae6eb7973d4e68895f92a1"

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
