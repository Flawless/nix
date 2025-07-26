{ pkgs, config, emacs-config, ... }:

{
  # Link the entire Emacs configuration from GitHub
  ".emacs.d" = {
    source = emacs-config;
    recursive = true;
  };
}
