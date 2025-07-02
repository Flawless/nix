{ pkgs, config, ... }:

{
  # Initializes Emacs with org-mode so we can tangle the main config
  ".emacs.d/init.el" = {
    text = builtins.readFile ../shared/config/emacs/init.el;
  };

  # GPG configuration
  ".gnupg/gpg.conf" = {
    text = ''
      # GPG Configuration
      # Set card timeout to 0 (no timeout) or 120 seconds
      card-timeout 0
      
      # Additional recommended GPG settings
      use-agent
      pinentry-mode loopback
      default-key 0
    '';
  };
}
