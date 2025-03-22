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
    nftables.enable = true;
    firewall = {
      enable = true;
      allowPing =  true;
      pingLimit = "2/second burst 5 packets";
    };
  };
}
