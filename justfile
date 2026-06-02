build: build-rs build-jvm build-js build-py

test: test-rs test-jvm test-js test-py

check: check-rs check-jvm check-js check-py

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

build-jvm:
    gradle --project-dir jvm build

test-jvm:
    gradle --project-dir jvm test

check-jvm:
    gradle --project-dir jvm compileJava compileKotlin

build-js:
    npm run --prefix js build

test-js:
    npm run --prefix js test

check-js:
    npm run --prefix js check

publish-js:
    npm run --prefix js build
    npm publish --prefix js

build-py:
    py/.venv/bin/python -m build py/

test-py:
    echo "No tests yet"

check-py:
    py/.venv/bin/python -m py_compile py/idkollen_client/_client.py

publish-py:
    py/.venv/bin/pip install build twine -q
    py/.venv/bin/python -m build py/
    py/.venv/bin/twine upload py/dist/*
