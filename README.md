<img align="left" height="100" style="margin-right: 10px;" src="./img/icon.png">

# IDkollen API Clients

[![MIT license][license-image]][license-url]

[license-image]: https://img.shields.io/badge/license-MIT-blue?style=flat-square
[license-url]: https://opensource.org/license/mit

Client libraries for the [IDkollen](https://idkollen.se) REST API, available for a variety of languages.

API documentation is available at https://developers.idkollen.se.

## Quick start

```sh
# Build all clients
just build

# Run all tests
just test

# Type-check and lint
just check
```

Individual recipes are available per language (`just build-rs`, `just test-jvm`, `just check-js`). See the `justfile` for the full list.

## Clients

| Directory | Language      | Documentation | 
|-----------|---------------|---------------|
| `go/`     | Go            | [Link](/go)   |
| `js/`     | TypeScript/JS | [Link](/js)   |
| `jvm/`    | Java + Kotlin | [Link](/jvm)  |
| `py/`     | Python        | [Link](/py)   |
| `rust/`   | Rust          | [Link](/rust) |

## API coverage

All clients expose the same set of authentication providers:

- **BankID SE** — Swedish BankID (auth, sign, phone auth/sign, QR verify, age verification)
- **BankID NO** — Norwegian BankID (auth, backchannel auth, sign, age verification)
- **Freja eID** — Swedish/Norwegian Freja (auth, backchannel auth, sign, backchannel sign, age verification)
- **MitID** — Danish MitID (auth, backchannel auth, sign)
- **FTN** — Finnish Trust Network (auth, age verification)
- **Vipps MobilePay** — Nordic Vipps (auth, backchannel auth)
- **Document** — Upload and download documents for signing sessions
