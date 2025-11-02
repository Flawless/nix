{ pkgs }:

with pkgs;
let
  # Override nodejs to skip failing tests on macOS
  nodejs-fixed = nodejs.overrideAttrs (oldAttrs: {
    doCheck = false;
  });

  codex = writeShellApplication {
    name = "codex";
    runtimeInputs = [ nodejs-fixed ];
    text = ''
      exec npx @openai/codex@latest "$@"
    '';
  };
in [
  # General packages for development and system management
  aria2
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
  mkcert # Local development SSL certificates
  nmap
  pass
  inetutils # Provides telnet and other network utilities
  totp-cli
  wireguard-tools # WireGuard VPN client tools

  # Cloud-related tools and SDKs
  argocd
  docker
  docker-compose
  kubernetes-helm
  kubeseal
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
  noto-fonts-color-emoji
  meslo-lgs-nf
  spotify
  monitorcontrol

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
  jre # Java 21 LTS runtime (default)
  maven
  gradle

  # Text and terminal utilities
  claude-code
  gh
  glab
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
  pipx # Install Python CLI tools in isolated environments

  # iOS development tools
  idb-companion # Facebook's iOS Development Bridge companion (requires fb-idb Python client)

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

  # LaTeX/TeX packages for document generation
  texlive.combined.scheme-full  # Full scheme includes all packages including wrapfig, rotating, etc.
  codex
]
