_: {
  imports = [
    # General Configuration
    ./auto_cmds.nix
    ./file_types.nix
    ./keymaps.nix
    ./settings.nix

    # Themes
    ./plugins/themes

    # UI
    ./plugins/ui/startup.nix
  ];
}
