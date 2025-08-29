{inputs}: let
  inherit (inputs) nixpkgs;

  # This is the only architecture I use here
  system = "x86_64-linux";
in {
  wsl = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs system;
    };
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    modules = with inputs;
      [
        nixos-wsl.nixosModules.default
        hjem.nixosModules.default
        sops-nix.nixosModules.sops
        nix-secrets.nixosModules.ssh
        nix-secrets.nixosModules.common
        home.hjemConfigurations.wsl
      ]
      ++ [
        ../configurations/wsl.nix
        ../modules
      ];
  };
}
