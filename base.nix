{inputs, ...}: let
  inherit (inputs) nixos-wsl vscode-server;
in {
  imports = [
    vscode-server.nixosModules.default
    nixos-wsl.nixosModules.default
    ./modules
    ./pkgs
    ./programs
    ./system
  ];

  features.michael.packages.zed = {
    include = true;
  };

  networking = {
    hostName = "wsl";
    nameservers = ["1.1.1.1" "8.8.8.8" "9.9.9.9"];
  };
}
