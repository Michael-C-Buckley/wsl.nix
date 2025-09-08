{pkgs, ...}: {
  fonts.packages = with pkgs; [
    vista-fonts
    nerd-fonts.jetbrains-mono
  ];

  environment.systemPackages = with pkgs; [
    # System
    fastfetch
    microfetch
    killall
    hydra-cli
    socat

    # Browsers
    librewolf

    # Shells
    nushell
    tmux
    starship

    # Editor
    helix

    # File/Navigation
    fd
    dust
    fzf
    ripgrep
    wget

    # Performance
    btop
    htop

    # Hardware
    usbutils
    pciutils

    # Network
    dig
    dhcpcd
    nmap
    iperf
    tcpdump
    inetutils
    ndisc6
    frr
    nettools

    # Virtualization
    containerlab
  ];
}
