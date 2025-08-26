{inputs}: let 
  inherit (inputs) nixpkgs nixos-wsl hjem nix-secrets sops-nix;
  
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
        modules = [
            nixos-wsl.nixosModules.default
            hjem.nixosModules.default
            sops-nix.nixosModules.sops
            nix-secrets.nixosModules.ssh
            nix-secrets.nixosModules.common
            ../configurations/wsl.nix
            ../modules
        ];
    };
}