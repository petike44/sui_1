# sui_1

Top-level repo for Sui Move example packages. The actionable package for now is `tip_jar/`.

Quick notes

- The Move package manifest for `tip_jar` lives at `tip_jar/Move.toml`. Run build/test from inside that folder.
- If you prefer running `sui move build` from the repo root, see the optional workspace snippet below.

Build (WSL / Linux style)

```bash
cd /mnt/c/Users/Peti/zoli/sui/sui_1/tip_jar
sui move build
```

Build (PowerShell)

```powershell
Set-Location -Path 'C:\Users\Peti\zoli\sui\sui_1\tip_jar'
sui move build
```

Run tests (from package dir)

```bash
sui move test
```

Optional: make the repo a Move workspace

If you'd like to run `sui move build` from the repo root and have it build `tip_jar`, create `Move.toml` at the repo root with this content:

```toml
[package]
name = "sui_1-workspace"
version = "0.0.0"

[workspace]
members = ["tip_jar"]
```

Recommended VS Code extensions (for Move development)

- `movebit.sui-move-analyzer` (analyzer / types / diagnostics)
- `damirka.move-syntax` (syntax highlighting)
- `mysten.move` (Sui Move integration)

If syntax highlighting or the language server isn't active:

1. Reload the window (Ctrl+Shift+P → Developer: Reload Window).
2. Ensure `.move` files are detected as Move (click the language in the status bar).
3. Reinstall/enable the extensions above.

More documentation and package-specific notes are in `tip_jar/README.md`.

If you want, I can add a workspace-level `Move.toml` and run a test build from the repo root — say the word and I'll do it.
