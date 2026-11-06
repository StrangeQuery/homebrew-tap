class Heartburn < Formula
  desc "CARDIAC tools: the burn runtime, the carc assembler and the ekg debugger"
  homepage "https://lab.strangequery.com/cardiac/"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StrangeQuery/heartburn/releases/download/v0.1.2/heartburn-aarch64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/StrangeQuery/heartburn/releases/download/v0.1.2/heartburn-x86_64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/StrangeQuery/heartburn/releases/download/v0.1.2/heartburn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/StrangeQuery/heartburn/releases/download/v0.1.2/heartburn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "burn", "carc", "ekg"
  end

  test do
    assert_match "burn", shell_output("#{bin}/burn --version")
  end
end
