{self, ...}: {
  # The various components that should be built, which is the devShells by definitions
  #  and the systems, by their top level refenence
  flake.hydraJobs = {
    inherit (self) devShells;
    nixosConfigurations = {
      wsl = self.nixosConfigurations.wsl.config.system.build.toplevel;
    };
  };
}
