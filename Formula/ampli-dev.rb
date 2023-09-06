class AmpliDev < Formula
  desc "The Ampli CLI (Dev)"
  homepage "https://amplitude.com"
  url "https://github.com/amplitude/homebrew-ampli/releases/download/v1.33.1-master-20230906233411.0/ampli-v1.33.1-master-20230906233411.0.tar.gz"
  version "1.33.1-master-20230906233411.0"
  sha256 "bf90769b26f524e3d46800fc695f70a5f3bd525cf6a03c14b8cdd38d9f50392a"

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
