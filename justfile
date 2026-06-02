build: build-rs

test: test-rs

check: check-rs

build-rs:
    cargo build --all-features --manifest-path rust/Cargo.toml

test-rs:
    cargo test --all-features --manifest-path rust/Cargo.toml

check-rs:
    cargo check --all-features --manifest-path rust/Cargo.toml
