{ config, pkgs, lib, home-manager, nur, ... }:

let
 # hostname = "ripbook";
  username = "stein";
in {
  imports = [
    ../roles/home-manager/settings.nix
    ../roles/brew.nix
    ../roles/defaults.nix
    ../roles/network.nix
    ../roles/ripbook.nix
    ../roles/yabai.nix
  ];
  # Define user settings
  users.users.${username} = import ../roles/user.nix { inherit config; inherit pkgs; };

  # Set home-manager configs for username
  home-manager.users.${username} = import ../roles/home-manager/user.nix;

  # Set hostname
  networking.hostName = "ripbook";

  # Always show menu bar on ripbook
  system.defaults.NSGlobalDomain._HIHideMenuBar = lib.mkForce false;

  system.stateVersion = 5;
}
