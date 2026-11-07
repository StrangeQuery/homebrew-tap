class CargoCardiac < Formula
  desc "Rust for CARDIAC: compiles a Rust program to a CARDIAC deck"
  homepage "https://lab.strangequery.com/rust-cardiac/"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.1/cargo-cardiac-aarch64-apple-darwin.tar.gz"
      sha256 "9dc1cd8cd360cdb77db184f9200a7ca0dcf7df3c04e8381d15ccf528fb3cdb8f"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.1/cargo-cardiac-x86_64-apple-darwin.tar.gz"
      sha256 "bbddf86c0d1745aeae615bda587dbf05e56d6bbe91f9aea023d7a00dcd3eaec1"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.1/cargo-cardiac-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "03bc194bcabc8936b70ad48d7866c4a49fc0f2c6515a7c6af9565662e43fcdfd"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.1/cargo-cardiac-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c77f1de417c70fb10c3fae4c47b48486469ff9171eb1dd211d7efe2d10b819f3"
    end
  end

  def install
    bin.install "cargo-cardiac", "cardiac-driver"
  end

  def caveats
    <<~EOS
      cargo cardiac needs rustup (https://rustup.rs). `cargo cardiac setup` installs
      the nightly its driver runs on, with rustup (about 550 MB, once); the first
      build does it too if you haven't.
    EOS
  end

  test do
    assert_match "cardiac", shell_output("#{bin}/cargo-cardiac cardiac --help")
  end
end
