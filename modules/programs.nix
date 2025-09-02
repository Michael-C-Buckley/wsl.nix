{pkgs, ...}: {
  programs = {
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batgrep
        batman
        batwatch
        batpipe
      ];
    };

    direnv = {
      enable = true;
      silent = false;
      loadInNixShell = true;
      nix-direnv = {
        enable = true;
        package = pkgs.nix-direnv;
      };
    };

                # Allows vscode remotes to connect
                nix-ld.enable = true;

    # Nvim default, NVF provides the actual package
    neovim.defaultEditor = true;

    zsh.enable = true;
    zoxide.enable = true;
  };
}
