build: build-rs build-jvm build-js build-py build-go build-php build-cs

test: test-rs test-jvm test-js test-py test-go test-php test-cs

check: check-rs check-jvm check-js check-py check-go check-php check-cs

publish: publish-rs publish-jvm publish-js publish-py publish-php publish-cs

gen-doc: gen-doc-rs gen-doc-jvm gen-doc-js gen-doc-py

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

gen-doc-rs:
    rm -rf docs/rs
    cargo doc --no-deps --all-features --manifest-path rust/Cargo.toml --target-dir docs/rs

build-jvm:
    gradle --project-dir jvm build

test-jvm:
    gradle --project-dir jvm test

check-jvm:
    gradle --project-dir jvm compileJava compileKotlin

publish-jvm:

gen-doc-jvm:
    gradle --project-dir jvm :core:javadoc
    rm -rf docs/jvm
    cp -r jvm/core/build/docs/javadoc docs/jvm

build-js:
    npm run --prefix js build

test-js:
    npm run --prefix js test

check-js:
    npm run --prefix js check

publish-js:
    npm run --prefix js build
    npm publish --prefix js

gen-doc-js:
    npm run --prefix js gen:doc

build-py:
    uv build --directory py

test-py:
    uv run --directory py --extra dev pytest

check-py:
    uv run --directory py python -m py_compile idkollen_client/_client.py

publish-py:
    uv build --directory py
    uv publish --directory py

gen-doc-py:
    uv run --directory py --extra dev python -m pdoc -o ../docs/py idkollen_client

build-go:
    go -C go build ./...

test-go:
    go -C go test ./...

check-go:
    go -C go vet ./...

gen-doc-go:
    # pkg.go.dev serves docs automatically on publish

build-php:
    composer --working-dir=php install

test-php:
    composer --working-dir=php test

check-php:
    composer --working-dir=php check

publish-php:
    # tag release and push; Packagist auto-syncs from GitHub

build-cs:
    dotnet build csharp/Idkollen.Client.slnx

test-cs:
    dotnet test csharp/Idkollen.Client.slnx

check-cs:
    dotnet build csharp/Idkollen.Client.slnx --no-restore /warnaserror

publish-cs:
    dotnet pack csharp/src/Idkollen.Client/Idkollen.Client.csproj -c Release
