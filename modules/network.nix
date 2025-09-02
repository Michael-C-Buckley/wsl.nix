{config, ...}: {
  services.unbound = {
    # Keep non-sensitive settings here
    settings = {
      server = {
        hide-identity = "yes";
        hide-version = "yes";
        verbosity = 0;
      };
      include = config.sops.secrets.unboundLocal.path;
    };
  };

  networking = {
    nameservers = [
      "::1"
      "127.0.0.1"
      "1.1.1.1"
      "9.9.9.9"
    ];
  };
}
