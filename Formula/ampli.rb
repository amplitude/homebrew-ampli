class Ampli < Formula
  desc "The Ampli CLI"
  homepage "https://amplitude.com"
  url "https://github.com/amplitude/homebrew-ampli/releases/download/v1.31.5/ampli-v1.31.5.tar.gz"
  version "1.31.5"
  sha256 "c54f6f1cc1a18970afd426e6f8fb21f0ce4f935ddede588621e92b42d8ca0bb9"

  depends_on "node@18"

  def install
    inreplace "bin/ampli", /^CLIENT_HOME=/, "export AMPLI_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/ampli", "\"$DIR/node\"", "#{Formula["node@18"].bin}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/ampli" => "ampli"
  end

  test do
    system bin/"ampli", "version"
  end
end
