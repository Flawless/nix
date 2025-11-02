# Pin emacs-git to a specific commit to avoid constant rebuilds
# To update: comment out this overlay or update the rev
# TEMPORARILY DISABLED - Emacs-git has build issues
final: prev: {
  # emacs-git = prev.emacs-git.overrideAttrs (oldAttrs: {
  #   src = prev.fetchFromGitHub {
  #     owner = "emacs-mirror";
  #     repo = "emacs";
  #     # Current commit from emacs-git (2025-07-27)
  #     rev = "62fba3a723d10d53a8bac1351e762874ec0c9360";
  #     sha256 = "0g3fwrddznmlh5c53ks5bdqfpn69sy1x0888jpwi60m7866mx41i";
  #   };
  #   version = "20250728.0-pinned";
  # });
}