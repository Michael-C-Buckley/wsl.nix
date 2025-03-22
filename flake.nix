{
  description = "NixOS WSL Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    # User configs
    michael-home = {
      url = "github:Michael-C-Buckley/home-config";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "";
    };
    hjem.follows = "michael-home/hjem";
    wfetch.url = "github:iynaix/wfetch";

    # Custom Modules
    nix-devshells.url = "github:Michael-C-Buckley/nix-devshells";
    nixos-modules.url = "github:Michael-C-Buckley/nixos-modules";

    # Utilities
    vscode-server.url = "github:nix-community/nixos-vscode-server";
  };

  outputs = {nixpkgs, nix-devshells, ...} @ inputs: {
    checks = nix-devshells.checks;
    devShells.x86_64-linux.default = nix-devshells.devShells.x86_64-linux.nixos;
    nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./base.nix
        inputs.michael-home.nixosModules.hjem.wsl
      ];
    };
  };
}
