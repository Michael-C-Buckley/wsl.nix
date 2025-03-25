{inputs, ...}: let
  inherit (inputs) nixos-wsl vscode-server;
in {
  imports = [
    vscode-server.nixosModules.default
    nixos-wsl.nixosModules.default
    ./pkgs
    ./programs
    ./system
  ];

  # Fonts have an error but aren't being used anyway
  # features.pkgs.fonts = false;

  wsl = {
    enable = true;
    defaultUser = "michael";
  };

  networking.hostName = "wsl";
}
