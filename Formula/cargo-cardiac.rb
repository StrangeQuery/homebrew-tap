class CargoCardiac < Formula
  desc "Rust for CARDIAC: compiles a Rust program to a CARDIAC deck"
  homepage "https://lab.strangequery.com/rust-cardiac/"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.1.2/cargo-cardiac-aarch64-apple-darwin.tar.gz"
      sha256 "2c5d8417339c7a0a8c27dda6741858e91acb0eafc5401fb9d310b8aa18d70686"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.1.2/cargo-cardiac-x86_64-apple-darwin.tar.gz"
      sha256 "ee076578f47e67f82d8d74e243f01239d1c5d52c363a1a6d16241a4cd46adaa1"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.1.2/cargo-cardiac-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "81529acc6a7e8d23aebe1fa3df6bbb475369ddfad4ab5baa8b01d66ff1513718"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.1.2/cargo-cardiac-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a21f59e3050440f0a069bf5d16d5f4fa23159803b5835c0fa895f6a4a866e26d"
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
