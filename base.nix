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

  wsl = {
    enable = true;
    defaultUser = "michael";
  };

  networking = {
    hostName = "wsl";
    nameservers = ["1.1.1.1" "8.8.8.8" "9.9.9.9"];
  };
}
