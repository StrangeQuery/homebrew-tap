class CargoCardiac < Formula
  desc "Rust for CARDIAC: compiles a Rust program to a CARDIAC deck"
  homepage "https://lab.strangequery.com/rust-cardiac/"
  version "0.2.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.5/cargo-cardiac-aarch64-apple-darwin.tar.gz"
      sha256 "f44fbf6ff4817fe92b113e3e156f092dc7c2c52affef4ca1fbaafc57515833f8"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.5/cargo-cardiac-x86_64-apple-darwin.tar.gz"
      sha256 "ad86c8b261e7a21a282853b3580248290f467c4d82e5fe9dcf0cbbd382fb98c8"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.5/cargo-cardiac-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cd502615a229069b91871bcb74acfb1e2884688c1414b45e1d569b0c254b30f4"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.5/cargo-cardiac-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e714533c2d18be8683f5b02b133916c0b528b1d5165ca4742bace93eff071b3"
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
