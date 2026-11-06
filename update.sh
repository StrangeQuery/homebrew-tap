#!/bin/sh
# Writes Formula/heartburn.rb and Formula/cargo-cardiac.rb for a release of each, from the checksums the releases
# carry: sh update.sh HEARTBURN_VERSION CARGO_CARDIAC_VERSION (say, sh update.sh 0.1.2 0.1.2).
set -e
cd "$(dirname "$0")"
sums() { gh release download "v$2" --repo "StrangeQuery/$1" --pattern SHA256SUMS --output - ; }
sha() { printf '%s\n' "$1" | awk -v f="$2" '$2 == f { print $1 }'; }

# formula NAME REPO VERSION ARCHIVE-PREFIX DESC HOMEPAGE BINS CAVEATS DEPENDS
formula() {
  name=$1 deps=$9
  s=$(sums "$2" "$3")
  url="https://github.com/StrangeQuery/$2/releases/download/v$3"
  class=$(printf '%s' "$1" | awk -F- '{ for (i = 1; i <= NF; i++) printf "%s", toupper(substr($i, 1, 1)) substr($i, 2) }')
  {
    echo "class $class < Formula"
    echo "  desc \"$5\""
    echo "  homepage \"$6\""
    echo "  version \"$3\""
    echo "  license \"MIT\""
    [ -n "$deps" ] && echo "  depends_on \"$deps\""
    echo
    for pair in "macos arm aarch64-apple-darwin" "macos intel x86_64-apple-darwin" "linux arm aarch64-unknown-linux-gnu" "linux intel x86_64-unknown-linux-gnu"; do
      set -- $pair
      echo "  on_$1 do"
      echo "    on_$2 do"
      echo "      url \"$url/$PREFIX-$3.tar.gz\""
      echo "      sha256 \"$(sha "$s" "$PREFIX-$3.tar.gz")\""
      echo "    end"
      echo "  end"
    done
    echo
    echo "  def install"
    echo "    bin.install $BINS"
    echo "  end"
    if [ -n "$CAVEATS" ]; then
      echo
      echo "  def caveats"
      echo "    <<~EOS"
      printf '%s\n' "$CAVEATS" | sed 's/^/      /'
      echo "    EOS"
      echo "  end"
    fi
    echo
    echo "  test do"
    echo "    $TEST"
    echo "  end"
    echo "end"
  } > "Formula/$name.rb"
  echo "wrote Formula/$name.rb"
}

PREFIX=heartburn BINS='"burn", "carc", "ekg"' CAVEATS= \
TEST='assert_match "burn", shell_output("#{bin}/burn --version")' \
formula heartburn heartburn "$1" heartburn "CARDIAC tools: the burn runtime, the carc assembler and the ekg debugger" \
  "https://lab.strangequery.com/heartburn/" "" "" ""

PREFIX=cargo-cardiac BINS='"cargo-cardiac", "cardiac-driver"' \
CAVEATS='cargo cardiac needs rustup (https://rustup.rs). `cargo cardiac setup` installs
the nightly its driver runs on, with rustup (about 550 MB, once); the first
build does it too if you haven'"'"'t.' \
TEST='assert_match "cardiac", shell_output("#{bin}/cargo-cardiac cardiac --help")' \
formula cargo-cardiac rust-cardiac "$2" cargo-cardiac "Rust for CARDIAC: compiles a Rust program to a CARDIAC deck" \
  "https://lab.strangequery.com/rust-cardiac/" "" "" ""
