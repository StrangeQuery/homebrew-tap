class CargoCardiac < Formula
  desc "Rust for CARDIAC: compiles a Rust program to a CARDIAC deck"
  homepage "https://lab.strangequery.com/rust-cardiac/"
  version "0.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.4/cargo-cardiac-aarch64-apple-darwin.tar.gz"
      sha256 "e4d8844ca0fd62d7fa6e613d2079ec80798d68020d6b50bf00cacf012037d813"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.4/cargo-cardiac-x86_64-apple-darwin.tar.gz"
      sha256 "391d7a142a8cc89d752cebc82769ed82a770a7c8e12c2655815d697506a12edd"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.4/cargo-cardiac-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a0d19727f275a508f6e73ead5b927495228fa9c9b3632527ae4ee815768b7561"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/StrangeQuery/rust-cardiac/releases/download/v0.2.4/cargo-cardiac-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce25496fcc90f3b294ed8dd41a6fb363ffa82de432ce0693147b93f0415a8af4"
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
