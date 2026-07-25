{ ... }: {
  users.users.guest = {
    isNormalUser = true;
    home = "/home/guest";
    extraGroups = [
      "wheel"
      "input"
      "audio"
      "video"
      "render"
      "networkmanager"
    ];
    initialPassword = "guest";
  };
}
