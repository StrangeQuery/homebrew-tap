class Cardiaq < Formula
  desc "CARDIAC tools: the burn runtime, the carc assembler and the ekg debugger"
  homepage "https://lab.strangequery.com/cardiaq/"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StrangeQuery/cardiaq/releases/download/v0.1.0/cardiaq-aarch64-apple-darwin.tar.gz"
      sha256 "a0901720282c39ca16d74f1062eda3c2339f83ba00b90d2dda15e91788f5c451"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/StrangeQuery/cardiaq/releases/download/v0.1.0/cardiaq-x86_64-apple-darwin.tar.gz"
      sha256 "689113766c3bdd87b260e52fa45653d5f06dde17e882b82e45c60882fa42d7b4"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/StrangeQuery/cardiaq/releases/download/v0.1.0/cardiaq-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5b2c4e1c4fa99feee8a9b5c0baf20ddae42d9cd8cf0245c0911775175d9db22f"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/StrangeQuery/cardiaq/releases/download/v0.1.0/cardiaq-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "08a428efae5760d4b33707a0999e0996d759623e831eb7ea6e30f77aca059f48"
    end
  end

  def install
    bin.install "burn", "carc", "ekg"
  end

  test do
    assert_match "burn", shell_output("#{bin}/burn --version")
  end
end
