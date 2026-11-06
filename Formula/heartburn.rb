class Heartburn < Formula
  desc "CARDIAC tools: the burn runtime, the carc assembler and the ekg debugger"
  homepage "https://lab.strangequery.com/heartburn/"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StrangeQuery/heartburn/releases/download/v0.1.3/heartburn-aarch64-apple-darwin.tar.gz"
      sha256 "87a80f8829933b46534bf072f68e6c7c285036c7987f62fbf8bee63250bd23ee"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/StrangeQuery/heartburn/releases/download/v0.1.3/heartburn-x86_64-apple-darwin.tar.gz"
      sha256 "2bfbfdb485b89bf5b09a67ccff0cb1fcdc54cdb6317556232889c61bdf107136"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/StrangeQuery/heartburn/releases/download/v0.1.3/heartburn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "23a6d30014934ad560c53573f23a943f4c92ccd24e2f97eb948368afadaa44ef"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/StrangeQuery/heartburn/releases/download/v0.1.3/heartburn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6235d3945409221655af701fa15e172df565b89a6ace73bc43b9492dceb48db5"
    end
  end

  def install
    bin.install "burn", "carc", "ekg"
  end

  test do
    assert_match "burn", shell_output("#{bin}/burn --version")
  end
end
