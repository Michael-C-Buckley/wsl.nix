{
  description = "Michael's WSL Flake";

  outputs = {flake-parts, ...} @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import inputs.systems;

      flake = {
        nixosConfigurations = import ./outputs/nixosConfigurations.nix {inherit inputs;};
      };

      perSystem = {pkgs, ...}: {
        devShells = import ./outputs/devShells.nix {inherit pkgs;};
      };
    };

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";

    nix-secrets = {
      url = "git+ssh://git@github.com/michael-c-buckley/nix-secrets?shallow=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/nixos-wsl";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home = {
      url = "github:Michael-C-Buckley/home-config";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        systems.follows = "systems";
      };
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
