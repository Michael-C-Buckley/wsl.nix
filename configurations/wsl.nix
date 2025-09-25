{pkgs, ...}: {
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

  services.unbound.enable = true;
  system.stateVersion = "24.11";
  virtualisation.docker.enable = true;

  # For Intel Graphics
  hardware = {
    enableRedistributableFirmware = true;
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-compute-runtime
        intel-graphics-compiler
        intel-vaapi-driver
        intel-ocl
        ocl-icd
      ];
    };
  };
}
