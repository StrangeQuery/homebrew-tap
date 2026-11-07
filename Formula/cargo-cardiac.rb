class CargoCardiac < Formula
  desc "Rust for CARDIAC: compiles a Rust program to a CARDIAC deck"
  homepage "https://lab.strangequery.com/rust-cardiac/"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.3/cargo-cardiac-aarch64-apple-darwin.tar.gz"
      sha256 "3e057ce02643ffa2401182b535c1b4b7c7032ab6a8c3663ad4cd579788ea899e"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.3/cargo-cardiac-x86_64-apple-darwin.tar.gz"
      sha256 "91a3f0e05566a0b9dd0f450718a1a90e8daa36ff48669c14c839e17b5eb7e0c4"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.3/cargo-cardiac-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "24c8fa48ba70cdeb4a465944bd3ecd77fb05013e1fa9fd4e7b6ba1e3b4f3c783"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.3/cargo-cardiac-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "71097c24acf3f25a44cca2ec5aca486f09eb1cb4b4f044d5e62e3f3a191e433e"
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
