{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ragenix
    sops
  ];

  security = {
    sudo = {
      extraConfig = "Defaults lecture=never";
      wheelNeedsPassword = false;
    };
  };

  services = {
    vscode-server.enable = true;
    openssh = {
      enable = true;
      openFirewall = true;
    };
  };

  networking = {
    firewall = {
      enable = true;
      allowPing =  true;
    };
  };
}
