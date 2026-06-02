build: build-rs build-js

test: test-rs test-js

check: check-rs check-js

build-rs:
    cargo build --all-features --manifest-path rust/Cargo.toml

test-rs:
    cargo test --all-features --manifest-path rust/Cargo.toml

check-rs:
    cargo check --all-features --manifest-path rust/Cargo.toml
    cargo clippy --all-features --manifest-path rust/Cargo.toml
    cargo fmt --check --manifest-path rust/Cargo.toml

publish-rs:
    cargo publish --manifest-path rust/Cargo.toml

build-js:
    npm run --prefix js build

test-js:
    npm run --prefix js test

check-js:
    npm run --prefix js check

publish-js:
    npm run --prefix js build
    npm publish --prefix js
