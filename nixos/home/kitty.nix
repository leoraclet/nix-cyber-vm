{ ... }: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      enable_audio_bell = false;
      shell = "fish";
      font_family = "JetBrainsMono NF Medium";
      bold_font = "JetBrainsMono NF Bold";
      italic_font = "JetBrainsMono NF Italic";
      bold_italic_font = "JetBrainsMono NF Bold Italic";

      font_size = "12.0";

      adjust_line_height = "92%";

      scrollback_lines = 3000;

      macos_thicken_font = "0.3";

      linux_display_server = "x11";

      confirm_os_window_close = 0;
    };
  };
}
