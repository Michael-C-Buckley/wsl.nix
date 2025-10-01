# This is a simple set of tools that doesn't require pinning, just get them from the host
{pkgs ? import <nixpkgs> {}}:
pkgs.mkShellNoCC {
  buildInputs = with pkgs; [
    # Formatting
    alejandra
    mdformat
    biome
    editorconfig-checker
    shfmt
    treefmt
    taplo

    # Hooks
    deadnix
    lefthook
    shellcheck
    statix
    typos
  ];

  shellHook = ''
    lefthook install
    git fetch
    git status --short --branch
  '';
}
