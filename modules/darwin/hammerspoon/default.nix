{ config, pkgs, lib, ... }:

let
  user = "flawless";
  home = config.users.users.${user}.home;
in
{
  homebrew.casks = [ "hammerspoon" ];

  home-manager.users.${user} = { ... }: {
    home.file.".hammerspoon" = {
      source = ./.;
      recursive = true;
    };
  };

  system.activationScripts.postActivation.text = ''
    # Add Hammerspoon to login items if not already present
    if ! osascript -e 'tell application "System Events" to get the name of every login item' | grep -q "Hammerspoon"; then
      osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Hammerspoon.app", hidden:true}'
    fi
  '';
} 