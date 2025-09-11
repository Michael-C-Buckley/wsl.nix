{
  description = "Michael's WSL Flake";

  outputs = {flake-parts, ...} @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      # This is the only system I care about here
      systems = ["x86_64-linux"];

      # All outputs are defined in various modules here
      imports = [./outputs];

      # Mirror packages so that self references work in exported modules
      flake.packages = inputs.nixos.packages;
    };

  inputs = {
    # This is my primary flake
    nixos.url = "github:michael-c-buckley/nixos";

    # Reuse the inputs I care about
    nixpkgs.follows = "nixos/nixpkgs";
    flake-parts.follows = "nixos/flake-parts";
    nix-secrets.follows = "nixos/nix-secrets";
    sops-nix.follows = "nixos/sops-nix";

    # The only one not present there
    nixos-wsl = {
      url = "github:nix-community/nixos-wsl";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
