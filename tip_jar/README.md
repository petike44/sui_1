# tip_jar

A small Sui Move package that implements a shared "tip jar" object which accepts SUI tips, records totals and emits events.

## Prerequisites

- Sui CLI (sui) installed and on PATH. See https://docs.sui.io for installation.
- A working Move toolchain that the Sui CLI uses (usually bundled with the Sui toolchain).
- VS Code (optional) with Move language extensions for editor features.

## Recommended VS Code extensions

Install at least these for syntax, type info and formatting:

- `movebit.sui-move-analyzer` (language server / analyzer)
- `damirka.move-syntax` (syntax highlighting)
- `mysten.move` (Sui Move IDE integration)

After installing extensions reload the window (Developer: Reload Window) and ensure `.move` files are detected as Move (click language in status bar).

## Build (WSL / Linux style)

Open a terminal in the package directory and run:

```bash
cd /mnt/c/Users/Peti/zoli/sui/sui_1/tip_jar
sui move build
```

Or in PowerShell (Windows native):

```powershell
Set-Location -Path 'C:\Users\Peti\zoli\sui\sui_1\tip_jar'
sui move build
```

The CLI must be run from the directory that contains `Move.toml` (the package manifest). If you run `sui move build` from the repo root you will get `Unable to find package manifest` because the manifest is in `tip_jar/`.

## Run tests (basic)

If you want to run Move unit tests with the Sui CLI, run from the package directory:

```bash
sui move test
```

(Note: test command and behavior depends on your local Sui toolchain and version.)

## Formatting & type hints in VS Code

- Format document: `Shift+Alt+F` (Windows) or use the context menu → Format Document.
- See type information: hover over symbols to see inferred types and signatures (provided by the Move analyzer LSP).

If the editor shows no syntax highlighting:

1. Reload the window (Ctrl+Shift+P → Developer: Reload Window).
2. Make sure the file language is set to Move (click the language in the status bar).
3. Reinstall or enable the Move extensions listed above.

## Notes

- Keep `Move.toml` inside the package directory; don't move it to the repo root unless you mean the root to be a package.
- If you hit build/test errors, paste the CLI output and I can help debug.

## Contact / Next steps

If you'd like, I can:
- run a local build and paste the exact errors (if you share the CLI output), or
- add a tiny CONTRIBUTING or developer script to simplify running build/test commands.

Enjoy building! 🚀
