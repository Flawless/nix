{ pkgs }:

with pkgs;
let
  codex = writeShellApplication {
    name = "codex";
    runtimeInputs = [ nodejs ];
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
  hping
  iperf3
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
  nodejs  # Required for Claude Code and other node-based tools
  # nodePackages.npm # globally install npm
  # nodePackages.pnpm # pnpm package manager
  # yarn # yarn package manager
  # nodePackages.prettier
  bruno
  postman
  bun
  go
  clojure
  babashka
  polylith
  jdk17 # Java 17 LTS (required for Android development)
  maven
  gradle
  android-tools # adb, fastboot, platform tools

  # Android SDK with emulator
  (androidenv.composeAndroidPackages {
    cmdLineToolsVersion = "11.0";
    platformToolsVersion = "35.0.1";
    buildToolsVersions = [ "34.0.0" ];
    platformVersions = [ "34" ]; # Android 14
    includeEmulator = true;
    includeSystemImages = true;
    systemImageTypes = [ "google_apis_playstore" ];
    abiVersions = [ "arm64-v8a" ]; # Apple Silicon
    includeNDK = false; # Set true if you need native C/C++
  }).androidsdk

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
  sqlx-cli
  cargo-watch
  trunk
  wasm-bindgen-cli
  llvm

  # AI and machine learning tools
  # ollama - using homebrew version for latest updates

  # Accounting and financial tools
  ledger

  # LaTeX/TeX packages for document generation
  texlive.combined.scheme-full  # Full scheme includes all packages including wrapfig, rotating, etc.
  codex
]
