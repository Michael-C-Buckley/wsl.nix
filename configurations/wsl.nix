_: {
    networking = {
      hostId = "e07f0101";
    networkmanager = {
      enable = true;
      unmanaged = ["*"];
    };
  };

  services = {
    unbound.enable = true;
  };

  system = {
    stateVersion = "24.11";
  };

  virtualisation.podman.enable = true;
}
