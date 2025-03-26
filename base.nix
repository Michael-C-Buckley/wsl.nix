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

  # Currently fails to build
  features.michael.packages.zed = {
    include = false;
  };

  networking = {
    hostName = "wsl";
    nameservers = ["1.1.1.1" "8.8.8.8" "9.9.9.9"];
  };
}
