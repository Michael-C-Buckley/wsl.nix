{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [
      gnupg
      pinentry-curses
      opensc
      yubikey-manager
      yubikey-personalization
      yubico-piv-tool
      libp11
    ];
    etc."pkcs11/pkcs11.conf".text = ''
      module: ${pkgs.opensc}/lib/opensc-pkcs11.so
      critical: yes
      log-calls: yes
    '';
  };

  hardware.gpgSmartcards.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    enableBrowserSocket = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  services = {
    pcscd.enable = true;
    yubikey-agent.enable = false; # I'm using GPG for now
    udev.packages = [pkgs.yubikey-personalization];
  };

  # https://github.com/NixOS/nixpkgs/issues/290926
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (action.id == "org.debian.pcsc-lite.access_card") {
        return polkit.Result.YES;
      }
    });

    polkit.addRule(function(action, subject) {
      if (action.id == "org.debian.pcsc-lite.access_pcsc") {
        return polkit.Result.YES;
      }
    });
  '';
}
