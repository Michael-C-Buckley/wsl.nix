{
  description = "Michael's WSL Flake";

  outputs = {flake-parts, ...} @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import inputs.systems;

      flake = {
        nixosConfigurations = import ./outputs/nixosConfigurations.nix {inherit inputs;};
      };

       perSystem = {pkgs, ...}: {
         devShells.default = import ./outputs/devShells.nix {inherit pkgs;};
       };
    };

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    flake-parts.url = "git+https://github.com/hercules-ci/flake-parts?shallow=1";
    systems.url = "git+https://github.com/nix-systems/default?shallow=1";

    nix-secrets = {
      url = "git+ssh://git@github.com/michael-c-buckley/nix-secrets?shallow=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "git+https://github.com/nix-community/nixos-wsl?shallow=1&ref=main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    michael-home = {
      url = "github:Michael-C-Buckley/home-config";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        systems.follows = "systems";
        hjem.follows = "hjem";
        hjem-rum.follows = "hjem-rum";
        home-manager.follows = "";
      };
    };

    hjem = {
      url = "git+https://github.com/feel-co/hjem?shallow=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem-rum = {
      url = "git+https://github.com/snugnug/hjem-rum?shallow=1";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        hjem.follows = "hjem";
      };
    };

    sops-nix = {
      url = "git+https://github.com/Mic92/sops-nix?shallow=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "git+https://github.com/notashelf/nvf?shallow=1";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        systems.follows = "systems";
      };
    };
  };
}
