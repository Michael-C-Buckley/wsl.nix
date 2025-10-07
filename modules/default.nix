{
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/New_York";

  users.users.michael = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel" "video" "wireshark"];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "-d";
  };
}
