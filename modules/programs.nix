{pkgs, ...}: {
  programs = {
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batgrep
        batman
        batwatch
        prettybat
        batpipe
      ];
    };

    direnv = {
      silent = false;
      loadInNixShell = true;
      nix-direnv = {
        enable = true;
        package = pkgs.nix-direnv;
      };
    };

    neovim.defaultEditor = true;

    winbox = {
      enable = true;
      package = pkgs.winbox4;
      openFirewall = true;
    };


    wireshark.enable = true;
    zsh.enable = true;
    zoxide.enable = true;
  };
}
