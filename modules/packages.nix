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

    # Browsers
    librewolf
    ungoogled-chromium

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
  ];
}
