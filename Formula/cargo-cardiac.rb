class CargoCardiac < Formula
  desc "Rust for CARDIAC: compiles a Rust program to a CARDIAC deck"
  homepage "https://lab.strangequery.com/rust-cardiac/"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.0/cargo-cardiac-aarch64-apple-darwin.tar.gz"
      sha256 "f871a0de433324bd9e1609689b8934614433ee7b13dec44dfa3274e74b3ccdc8"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.0/cargo-cardiac-x86_64-apple-darwin.tar.gz"
      sha256 "742f10eb9ed4c0ffde876a5ce19926e3589faf53de6a4177f3c7b413bbc2e108"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.0/cargo-cardiac-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "adf150f85a48111c2a1a806bd8f292765d387b72dbc519c77b1d70cacc7d635f"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.0/cargo-cardiac-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e0aef2ab21c0651e923ac7d3dd13f78c5afcacaf9979a8e22d87ffb4f0f9e146"
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
