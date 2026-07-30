{ ... }: {
  # Options for the screen
  virtualisation.vmVariant = {
    virtualisation.resolution = {
      x = 1920;
      y = 1080;
    };
    virtualisation = {
      memorySize = 4096; # Use 2048MiB memory.
      cores = 4;
      qemu.options = [
        # Better display option
        "-vga virtio"
        "-display gtk,zoom-to-fit=false,show-cursor=on"
        # Enable copy/paste
        # https://www.kraxel.org/blog/2021/05/qemu-cut-paste/
        "-chardev qemu-vdagent,id=ch1,name=vdagent,clipboard=on"
        "-device virtio-serial-pci"
        "-device virtserialport,chardev=ch1,id=ch1,name=com.redhat.spice.0"
      ];
      sharedDirectories = {
        share = {
          source = "/home/leonne/Downloads";
          target = "/home/guest/Downloads";
        };
      };
    };
  };

  # For copy/paste to work
  services = {
    spice-vdagentd.enable = true;
    qemuGuest.enable = true;
  };
}
