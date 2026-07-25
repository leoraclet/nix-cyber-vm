{ ... }: {
  # Internationalisation options
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "fr";

  # X configuration
  services.xserver.enable = true;
  services.xserver.xkb.layout = "fr";
}
