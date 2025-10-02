{
  description = "Michael's WSL Flake";

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    hydraJobs = {
      nixosConfigurations.wsl = self.nixosConfigurations.wsl.config.system.build.toplevel;
    };
    nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
        customPkgs = inputs.nixos.packages."x86_64-linux";
      };
      modules = with inputs;
        [
          nixos-wsl.nixosModules.default
          sops-nix.nixosModules.sops
          nix-secrets.nixosModules.wsl
          nixos.hjemConfigurations.wsl
        ]
        ++ [
          ./configurations/wsl
          ./modules
        ];
    };
    inherit (inputs.nixos) packages;
  };

  inputs = {
    # This is my primary flake
    nixos = {
      url = "github:michael-c-buckley/nixos";

      # Eliminate unused inputs
      inputs = {
        mangowc.follows = "";
        nix4vscode.follows = "";
        noctalia.follows = "";
        impermanence.follows = "";
        quadlet-nix.follows = "";
        schizofox.follows = "";
      };
    };

    # Reuse the inputs I care about
    nixpkgs.follows = "nixos/nixpkgs";
    nix-secrets.follows = "nixos/nix-secrets";
    sops-nix.follows = "nixos/sops-nix";

    # The only one not present there
    nixos-wsl = {
      url = "github:nix-community/nixos-wsl";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
