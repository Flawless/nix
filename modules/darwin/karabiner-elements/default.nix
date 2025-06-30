{ config, pkgs, lib, ... }:

let
  user = "flawless";
  home = config.users.users.${user}.home;
in
{
  home-manager.users.${user} = { ... }: {
    home.file.".config/karabiner" = {
      source = ./.;
      recursive = true;
    };
  };

  system.activationScripts.postActivation.text = ''
    # Add Karabiner-Elements to login items if not already present
    if ! osascript -e 'tell application "System Events" to get the name of every login item' | grep -q "Karabiner-Elements"; then
      osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Karabiner-Elements.app", hidden:true}'
    fi
  '';
} 