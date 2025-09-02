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

    home = {
      url = "git+https://github.com/Michael-C-Buckley/home-config?shallow=1";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        systems.follows = "systems";
      };
    };

    sops-nix = {
      url = "git+https://github.com/Mic92/sops-nix?shallow=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
