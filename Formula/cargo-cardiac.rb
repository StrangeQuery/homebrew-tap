class CargoCardiac < Formula
  desc "Rust for CARDIAC: compiles a Rust program to a CARDIAC deck"
  homepage "https://lab.strangequery.com/rust-cardiac/"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.2/cargo-cardiac-aarch64-apple-darwin.tar.gz"
      sha256 "d47c9772fc4290bd496f0f44e1f32bfd927b8be7ccdf54516fa8ac0c10c411f7"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.2/cargo-cardiac-x86_64-apple-darwin.tar.gz"
      sha256 "7067d9d6c1980e9ca14133918c38d6904b1e65cd239c165c0f987c1756234b2b"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.2/cargo-cardiac-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "625ef36d4d6ae1ffc93b5a624b5f410d541a6f18ea7a34109507c9d17b1ecc3e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.2/cargo-cardiac-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e8e039da01944ff2203e65d2ce8d31ff0208a6abc7785bc439a17b2d7530fd4b"
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
