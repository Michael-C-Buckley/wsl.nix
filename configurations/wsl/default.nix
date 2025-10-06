{
  imports = [
    ./hjem.nix
  ];

  networking = {
    hostName = "wsl";
    hostId = "e07f0101";
    nameservers = [
      "::1"
      "127.0.0.1"
      "1.1.1.1"
      "9.9.9.9"
    ];
    networkmanager = {
      enable = true;
      unmanaged = ["*"];
    };
  };

  hardware.graphics.useIntel = true;

  services.unbound.enable = true;
  system.stateVersion = "24.11";
  virtualisation.docker.enable = true;
}
