{...}: {
  imports = [
    ./nix.nix
    ./risks.nix
    ./security.nix
  ];

  time.timeZone = "America/New_York";
  system.stateVersion = "24.11";

  users.users.michael = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "video" "wireshark" ];
  };
}
