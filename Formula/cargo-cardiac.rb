class CargoCardiac < Formula
  desc "Rust for CARDIAC: compiles a Rust program to a CARDIAC deck"
  homepage "https://lab.strangequery.com/cargo-cardiac/"
  version "0.1.0"
  license "MIT"
  depends_on "strangequery/tap/cardiaq"

  on_macos do
    on_arm do
      url "https://github.com/StrangeQuery/cargo-cardiac/releases/download/v0.1.0/cargo-cardiac-aarch64-apple-darwin.tar.gz"
      sha256 "e28109787f8d51cae1d23259ebb398de527d3a1d9d8e0e563df28beb73a03202"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/StrangeQuery/cargo-cardiac/releases/download/v0.1.0/cargo-cardiac-x86_64-apple-darwin.tar.gz"
      sha256 "dc5f7c8663eb7a7120f3e4d7d6984b77149a036ea5fb13d32db922bc228937a2"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/StrangeQuery/cargo-cardiac/releases/download/v0.1.0/cargo-cardiac-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bcea9e10c4fae0bfa612f1be40ce20f4f270d43effe301a8437c17856241e5a3"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/StrangeQuery/cargo-cardiac/releases/download/v0.1.0/cargo-cardiac-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "40b0a5f4c522707ab9f85167dc40b8bc4b8a9ab17e43d2c6c3aec8f3c51e4e25"
    end
  end

  def install
    bin.install "cargo-cardiac", "cardiac-driver"
  end

  def caveats
    <<~EOS
      cargo cardiac needs rustup (https://rustup.rs). The first time it compiles a
      program it installs the nightly its driver runs on, with rustup.
    EOS
  end

  test do
    assert_match "cardiac", shell_output("#{bin}/cargo-cardiac cardiac --help")
  end
end
