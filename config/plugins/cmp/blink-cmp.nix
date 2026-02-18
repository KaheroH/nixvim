{ lib, ... }:
{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      appearance = {
        nerd_font_variant = "normal";
        use_nvim_cmp_as_default = true;
      };
      completion = {
        accept = {
          auto_brackets.enabled = true;
        };

        documentation = {
          auto_show = true;
          auto_show_delay_ms = 250;
          treesitter_highlighting = true;
          window.border = "rounded";
        };

        list = {
          selection.preselect = lib.nixvim.mkRaw ''
            function(ctx)
                return ctx.mode == "cmdline" and "auto_insert" or "preselect"
            end,
          '';
        };

        menu = {
          border = "rounded";

          cmdline_position = lib.nixvim.mkRaw ''
            function()
              if vim.g.ui_cmdline_pos ~= nil then
                local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
                return { pos[1] - 1, pos[2] }
              end
              local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
              return { vim.o.lines - height, 0 }
            end
          '';
        };
      };
      keymap = {
        preset = "super-tab";
      };
      signature = {
        enabled = true;
      };
      sources = {
        cmdline = [ ];
        providers = {
          buffer = {
            score_offset = -7;
          };
          lsp = {
            fallbacks = [ ];
          };
        };
      };
    };
  };
}
