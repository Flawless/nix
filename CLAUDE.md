# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a **NixOS configuration repository** that provides unified system configuration for both **macOS (via nix-darwin)** and **NixOS (Linux)** systems. It uses Nix flakes for reproducible builds and dependency management.

## Architecture

### Module Organization
- **`modules/shared/`** - Cross-platform packages and configurations
  - `packages.nix` - Common development tools (Node.js, Python, Rust, Docker, AI tools)
  - `home-manager.nix` - User environment with zsh, tmux, Emacs configuration
- **`modules/darwin/`** - macOS-specific modules (Homebrew casks, Hammerspoon, Karabiner)
- **`modules/nixos/`** - Linux-specific modules (window manager, display config)
- **`hosts/`** - Platform-specific system configurations
- **`overlays/`** - Custom package overlays

### Key Files
- `flake.nix` - Main entry point defining system configurations and build apps
- `hosts/darwin/default.nix` - macOS system configuration
- `hosts/nixos/default.nix` - NixOS system configuration

## Common Commands

### Development and Testing
```bash
# Build and switch to new configuration (most common)
nix run .#build-switch

# Build only (Darwin)
nix run .#build

# Initial setup/apply configuration
nix run .#apply

# Rollback to previous generation (Darwin)
nix run .#rollback

# Development shell
nix develop
```

### Available Apps (via flake.nix)
- **Darwin**: apply, build, build-switch, rollback, copy-keys, create-keys, check-keys
- **NixOS**: apply, build-switch, copy-keys, create-keys, check-keys, install

### Platform-Specific Commands
```bash
# macOS (nix-darwin)
sudo darwin-rebuild switch --flake .#aarch64-darwin

# NixOS
sudo nixos-rebuild switch --flake .#x86_64-linux
```

## Code Patterns

### Adding Packages
- **Shared packages**: Add to `modules/shared/packages.nix`
- **macOS apps**: Add to `modules/darwin/casks.nix` (Homebrew casks)
- **NixOS packages**: Add to `modules/nixos/packages.nix`

### Module Structure
- Prefer structured modules under `modules/` rather than inline imports
- Follow existing patterns for platform-specific vs shared configuration
- Use `with pkgs;` pattern for package lists

### Configuration Management
- User configurations go in respective `home-manager.nix` files
- System-level configs in host-specific default.nix files
- Static config files in `modules/nixos/config/` or `modules/darwin/config/`

## Development Environment

The repository includes comprehensive development tools:
- **Languages**: Node.js, Python, Rust, Go, Bun
- **Tools**: Docker/OrbStack, git, direnv, fzf, ripgrep
- **Editors**: Emacs (with custom config), plus VS Code/Cursor support
- **Terminal**: tmux with custom configuration, zsh with Powerlevel10k
- **AI Tools**: claude-code, ollama

## Build Process

1. Flake inputs are locked in `flake.lock`
2. Platform detection determines which configuration to build
3. Modules are composed based on host configuration
4. Home Manager applies user-level configuration
5. System-level changes applied via darwin-rebuild or nixos-rebuild

## Agent Rules

- Enforce modular structure - avoid inline imports, use `modules/` directory
- Follow existing patterns for cross-platform vs platform-specific code
- Prefer editing existing modules over creating new files