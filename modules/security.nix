_: {
  security = {
    sudo = {
      extraConfig = "Defaults lecture=never";
      wheelNeedsPassword = false;
    };
  };

  services = {
    openssh = {
      enable = true;
      openFirewall = true;
    };
  };

  networking = {
    nftables.enable = true;
    firewall = {
      enable = true;
      allowPing = true;
    };
  };
}
