class AmpliNode < Formula
  desc "node.js dependency for Ampli CLI"
  homepage "https://amplitude.com"
  url "https://cli-assets.iterative.ly/node/node-12.16.2.tar.xz"
  sha256 "3be1a9fb2715f62561912d6e824f5e8dc2d64cf7e074f6c4ac8b5c9b4a836761"

  def install
    libexec.install buildpath/"node"
  end
end
