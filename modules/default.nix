_: {
  imports = [
    ./forwarders.nix
    ./gpg.nix
    ./network.nix
    #./nix.nix
    ./packages.nix
    ./programs.nix
    ./security.nix
    ./wsl.nix
  ];

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/New_York";

  users.users.michael = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel" "video" "wireshark"];
  };
}
