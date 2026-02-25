{
  plugins.neo-tree = {
    enable = true;

    settings = {
      close_if_last_window = true;
      filesystem = {
        bind_to_cwd = false;
        follow_current_file = {
          enabled = true;
        };
      };
      sources = [
        "filesystem"
        "buffers"
        "git_status"
        "document_system"
      ];
      add_blank_line_at_top = false;
      default_component_configs = {
        indent = {
          with_expanders = true;
          expander_collapsed = "󰅂";
          expander_expanded = "󰅀";
          expander_highlight = "NeoTreeExpander";
        };

        gitStatus = {
          symbols = {
            added = " ";
            conflict = "󰩌 ";
            deleted = "󱂥";
            ignored = " ";
            modified = " ";
            renamed = "󰑕";
            staged = "󰩍";
            unstaged = "";
            untracked = " ";
          };
        };
      };
    };
  };

  keymaps = [
    {
      mode = [ "n" ];
      key = "<C-n>";
      action = "<cmd>Neotree toggle<cr>";
      options = {
        desc = "Open/Close Neotree";
      };
    }
  ];
}
