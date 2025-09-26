{lib, ...}: {
  hjem.users.michael = {
    environmt.sessionVariables = {
      NH_FLAKE = lib.mkForce "/home/michael/flakes/wsl";
    };
  };
}
