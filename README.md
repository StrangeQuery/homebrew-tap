# Strange Query's Homebrew tap

Homebrew formulas for Strange Query's CARDIAC tools:

    brew install strangequery/tap/cardiaq          # burn, carc and ekg
    brew install strangequery/tap/cargo-cardiac    # the Rust compiler for CARDIAC (and cardiaq with it)

cargo-cardiac also needs rustup (https://rustup.rs): the first time it builds a program, it installs the nightly its
driver runs on.

`update.sh` writes the formulas from a release's checksums: `sh update.sh CARDIAQ_VERSION CARGO_CARDIAC_VERSION`.
