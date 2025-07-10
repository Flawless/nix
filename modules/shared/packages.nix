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

  # Encryption and security tools
  age
  age-plugin-yubikey
  gnupg
  libfido2
  pass
  totp-cli

  # Cloud-related tools and SDKs
  docker
  docker-compose
  colima
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

  # Node.js development tools
  nodePackages.npm # globally install npm
  nodePackages.prettier
  nodejs
  bruno
  postman

  # Text and terminal utilities
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
