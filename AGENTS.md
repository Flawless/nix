# Repository Guidelines

## Repository Overview
This flake-backed repo codifies both macOS (nix-darwin) and NixOS systems with shared modules and reproducible builds. Home Manager provides user tooling, while host directories tailor machine-specific overrides.

## Project Structure & Module Organization
- `flake.nix` — inputs, outputs, and app definitions
- `modules/shared/` — cross-platform packages (`packages.nix`) and user setup (`home-manager.nix`)
- `modules/darwin/` / `modules/nixos/` — platform add-ons (casks, Hammerspoon, Karabiner vs. bspwm, display, disk config)
- `hosts/hellblade` and `hosts/wireworm` — host-level options and secrets wiring
- `apps/<system>/` — architecture-specific shell helpers for `nix run`
- `overlays/` — custom package overlays; keep module assets beside their configs (e.g., `modules/nixos/config/`)

## Build, Test, and Development Commands
```bash
# Common lifecycle
nix run .#apply          # bootstrap host
nix run .#build-switch   # rebuild and switch immediately
nix run .#build          # dry-run a generation
nix develop              # enter dev shell
```
Use `nix run .#rollback` on Darwin for fast recovery. For targeted evaluation, call `nix build .#darwinConfigurations.hellblade.system` or `nix build .#nixosConfigurations.wireworm.config.system.build.toplevel`. Update inputs with `nix flake update`.

## Coding Style & Naming Conventions
Follow the two-space indentation used across Nix files, align semicolons, and group attributes logically. Favor composable modules over inline configuration; reuse helpers from `modules/shared` where possible. Scripts under `apps/` remain lowercase and hyphenated, carrying forward the existing colorized logging helpers. Route shared packages through `modules/shared/packages.nix` and platform extras through the respective `modules/darwin` or `modules/nixos` package lists.

## Testing Guidelines
Run `nix flake check` to catch evaluation issues. Validate changes with the build commands above and inspect the resulting `result` symlink. macOS contributors should follow with `nix run .#check-keys`; Linux contributors confirm disk edits align with `modules/nixos/disk-config.nix`. Target a single machine via `nix build .#nixosConfigurations.<host>` when iterating quickly.

## Commit & Pull Request Guidelines
History follows Conventional Commits (`feat:`, `fix:`, `chore:`). Keep subject lines under 72 characters and describe scope within the body. PRs should call out affected hosts, note any updates under `modules/secrets/`, and list the exact build or check command executed. Include screenshots when tweaking assets in `modules/nixos/config/` and link related issues whenever available.

## Keys & Secrets Workflow
Use `nix run .#create-keys` to mint ed25519 and age keys, `nix run .#copy-keys` to install them, and `nix run .#check-keys` to audit enrollment. Store encrypted blobs in `modules/secrets/`, never commit raw material, and document new consumers when secrets move.
