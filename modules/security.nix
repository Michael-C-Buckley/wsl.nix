_: {
  security = {
    sudo = {
      extraConfig = "Defaults lecture=never";
      wheelNeedsPassword = false;
    };
  };

  # The secret is owned by root by default as it is a common secret
  sops.secrets.unboundLocal = {
    owner = "unbound";
    group = "unbound";
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
      allowedUDPPorts = [53];
      allowPing = true;
    };
  };
}
