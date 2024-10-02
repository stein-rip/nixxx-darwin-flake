{ config, pkgs, ... }:

{
  description = "stein";
  name = "stein";
  shell = pkgs.bash;
  # These packages will only be installed for your user
  # The binaries will be available in the following path: /etc/profiles/per-user/$USER/bin
  packages = [
    pkgs.bash
    pkgs.zsh
    pkgs.gcc
    pkgs.git
    pkgs.gnupg
    pkgs.tmux
    pkgs.vscode
    pkgs.kitty
    pkgs.firefox
    
  ];

}
