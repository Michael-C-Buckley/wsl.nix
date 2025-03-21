{pkgs, ...}: {
  programs = {
    direnv = {
      silent = false;
      loadInNixShell = true;
      nix-direnv = {
        enable = true;
        package = pkgs.nix-direnv;
      };
    };

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    winbox = {
      enable = true;
      package = pkgs.winbox4;
      openFirewall = true;
    };

    wireshark.enable = true;

    zsh.enable = true;
  };
}
