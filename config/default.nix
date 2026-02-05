{
  imports = [
    # General Configuration
    ./auto_cmds.nix
    ./file_types.nix
    ./keymaps.nix
    ./settings.nix

    # Themes
    ./plugins/themes

    # Editor
    ./plugins/editor/navic.nix
    ./plugins/editor/neo-tree.nix
    ./plugins/editor/undotree.nix
    ./plugins/editor/illuminate.nix
    ./plugins/editor/indent-blankline.nix
    ./plugins/editor/treesitter.nix
    ./plugins/editor/noice.nix

    # UI
    ./plugins/ui/startup.nix
    ./plugins/ui/bufferline.nix
    ./plugins/ui/lualine.nix

    # Utilities
    ./plugins/utils/telescope.nix
    ./plugins/utils/which-key.nix

    # LSP
    ./plugins/lsp/lsp.nix
  ];
}
