# Strange Query's Homebrew tap

Homebrew formulas for Strange Query's CARDIAC tools. Homebrew asks you to add the tap and trust it first:

    brew tap strangequery/tap
    brew trust strangequery/tap

Then:

    brew install heartburn        # burn, carc and ekg
    brew install cargo-cardiac    # the Rust compiler for CARDIAC (and heartburn with it)

cargo-cardiac also needs rustup (https://rustup.rs): the first time it builds a program, it installs the nightly its
driver runs on.

`update.sh` writes the formulas from a release's checksums: `sh update.sh HEARTBURN_VERSION CARGO_CARDIAC_VERSION`.

heartburn was called cardiaq: `formula_renames.json` moves anyone who installed cardiaq onto heartburn at their
next `brew update`.
