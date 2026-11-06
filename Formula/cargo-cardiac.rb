class CargoCardiac < Formula
  desc "Rust for CARDIAC: compiles a Rust program to a CARDIAC deck"
  homepage "https://lab.strangequery.com/rust-cardiac/"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StrangeQuery/cargo-cardiac/releases/download/v0.1.1/cargo-cardiac-aarch64-apple-darwin.tar.gz"
      sha256 "5327d1a3ae68ea1b511efdf76d49d677711b038899dbe60737d08e214a43eb1b"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/StrangeQuery/cargo-cardiac/releases/download/v0.1.1/cargo-cardiac-x86_64-apple-darwin.tar.gz"
      sha256 "24a1029d83f9b4dcdc0eed9efcf242f3ae2f4b72105e5810437f91e6f30606ab"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/StrangeQuery/cargo-cardiac/releases/download/v0.1.1/cargo-cardiac-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b2e50b743cf537c771f4aa9249e88b44b444c3aca0a15b64589f578d426edfea"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/StrangeQuery/cargo-cardiac/releases/download/v0.1.1/cargo-cardiac-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e124471e2d951e481c461479b84d323bda70a02a6f99f9caecdf84ed0adc06e"
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
