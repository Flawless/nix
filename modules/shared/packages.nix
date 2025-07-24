{ pkgs }:

with pkgs; [
  # General packages for development and system management
  aspell
  aspellDicts.en
  bash-completion
  bat
  btop
  coreutils
  killall
  neofetch
  openssh
  sqlite
  wget
  zip
  fzf

  # Data tools
  postgresql
  pgcli
  psqlodbc

  # Encryption and security tools
  age
  age-plugin-yubikey
  gnupg
  libfido2
  nmap
  pass
  totp-cli

  # Cloud-related tools and SDKs
  docker
  docker-compose
  tilt

  # Media-related packages
  emacs-all-the-icons-fonts
  dejavu_fonts
  ffmpeg
  fd
  font-awesome
  hack-font
  noto-fonts
  noto-fonts-emoji
  meslo-lgs-nf
  spotify

  # development tools
  nodePackages.npm # globally install npm
  nodePackages.prettier
  nodejs
  bruno
  postman
  bun
  go

  # Text and terminal utilities
  claude-code
  htop
  hunspell
  iftop
  jetbrains-mono
  jq
  ripgrep
  tree
  tmux
  unrar
  unzip
  zsh-powerlevel10k
  timewarrior
  taskwarrior

  # Development environment tools
  direnv

  # Python packages
  python3
  poetry
  uv

  # Rust development tools
  cargo
  rustc
  rust-analyzer
  rustfmt
  clippy

  # AI and machine learning tools
  ollama

  # Accounting and financial tools
  ledger
]
