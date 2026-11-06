class Cardiaq < Formula
  desc "CARDIAC tools: the burn runtime, the carc assembler and the ekg debugger"
  homepage "https://lab.strangequery.com/cardiaq/"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StrangeQuery/cardiaq/releases/download/v0.1.1/cardiaq-aarch64-apple-darwin.tar.gz"
      sha256 "ed2e67c84a4f1c3d3547455541855860b51b55181b5ba4aa41df190b52729d56"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/StrangeQuery/cardiaq/releases/download/v0.1.1/cardiaq-x86_64-apple-darwin.tar.gz"
      sha256 "8c40fd22c8fd1d0c54ffe9dadb41303c047d05d72064e84d47483b5bc6d756b3"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/StrangeQuery/cardiaq/releases/download/v0.1.1/cardiaq-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c068f5ec53be3215ddb9a3f0f75b1f308be75b165abd21f44794a451a8fbb432"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/StrangeQuery/cardiaq/releases/download/v0.1.1/cardiaq-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e4b465324e2ec6457d96c5fe1cc4bd9fd0a341597ebe31d6de21bcd364d14f5d"
    end
  end

  def install
    bin.install "burn", "carc", "ekg"
  end

  test do
    assert_match "burn", shell_output("#{bin}/burn --version")
  end
end
