class CargoCardiac < Formula
  desc "Rust for CARDIAC: compiles a Rust program to a CARDIAC deck"
  homepage "https://lab.strangequery.com/rust-cardiac/"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.1.3/cargo-cardiac-aarch64-apple-darwin.tar.gz"
      sha256 "14009b93787ee1ed0433e78ea98ce25458985bc4bddbd6800969c0ffaa688471"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.1.3/cargo-cardiac-x86_64-apple-darwin.tar.gz"
      sha256 "c846ad8a8ef48782ea43bdc7c557ee7daf39883ae639b2f8cb6f5579c1fb0b0f"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.1.3/cargo-cardiac-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "850f1d67a5e1c18d4d1758395ab6ef08af94bc07db58f13c4f97755b2ba8b0e1"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.1.3/cargo-cardiac-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1e159b67806d112e91a186a3c2ff7aefdd5121fc8911488231f389b4a297308d"
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
