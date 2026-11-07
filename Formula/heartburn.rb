class Heartburn < Formula
  desc "CARDIAC tools: the burn runtime, the carc assembler and the ekg debugger"
  homepage "https://lab.strangequery.com/heartburn/"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StrangeQuery/heartburn/releases/download/v0.1.4/heartburn-aarch64-apple-darwin.tar.gz"
      sha256 "de7c21c0d47bbe632b9364d9cd22f4e20f467540b646a9ee2c9917cc98f6b515"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/StrangeQuery/heartburn/releases/download/v0.1.4/heartburn-x86_64-apple-darwin.tar.gz"
      sha256 "cd09055fcc3eef215dcecc4b4acc41e1091ff3c44a53e219626d2d6d60b15681"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/StrangeQuery/heartburn/releases/download/v0.1.4/heartburn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a087d410974138581172316df155eff51bdd13b60e383b792029a3b443caef6e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/StrangeQuery/heartburn/releases/download/v0.1.4/heartburn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b15ac8c568894989d48ace250f66bcd32b5f0944850cb92c458610dcaa39bfa"
    end
  end

  def install
    bin.install "burn", "carc", "ekg"
  end

  test do
    assert_match "burn", shell_output("#{bin}/burn --version")
  end
end
