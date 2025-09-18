{inputs, ...}: let
  inherit (inputs) self nixpkgs nixos;

  # This is the only architecture I use here
  system = "x86_64-linux";
in {
  flake.nixosConfigurations = {
    wsl = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit self inputs system;
        customPkgs = nixos.packages.${system};
      };
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      modules = with inputs;
        [
          nixos-wsl.nixosModules.default
          sops-nix.nixosModules.sops
          nix-secrets.nixosModules.wsl
          nixos.hjemConfigurations.wsl
        ]
        ++ [
          ../configurations/wsl.nix
          ../modules
        ];
    };
  };
}
