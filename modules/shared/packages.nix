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
  unixODBC

  # Data tools
  postgresql
  pgcli
  psqlodbc
  dbeaver-bin

  # Encryption and security tools
  age
  age-plugin-yubikey
  gnupg
  libfido2
  nmap
  pass
  inetutils # Provides telnet and other network utilities
  totp-cli

  # Cloud-related tools and SDKs
  docker
  docker-compose
  kubernetes-helm
  tilt
  lens

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
  betterdisplay

  # development tools
  nodePackages.npm # globally install npm
  nodePackages.pnpm # pnpm package manager
  yarn # yarn package manager
  nodePackages.prettier
  bruno
  postman
  bun
  go
  clojure
  polylith
  jre # Java runtime for running applications
  maven
  gradle

  # Text and terminal utilities
  claude-code
  gh
  gitu
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
  pre-commit
  ngrok

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
  # ollama - using homebrew version for latest updates

  # Accounting and financial tools
  ledger
]
