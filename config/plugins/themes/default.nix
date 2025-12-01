{
  colorschemes = {
    rose-pine = {
      settings = {
        enable = true;
        #        before_highlights = ''
        #          function(highlights)
        #            return {
        #            CursorLineNr = { fg = highlights.peach, style = {} },
        #            NavicText = { fg = highlights.text },
        #            }
        #          end
        #        '';
        dark_variant = "moon";
        extend_background_behind_borders = true;
        groups = {
          border = "muted";
          link = "iris";
          panel = "surface";
        };
        no_bold = false;
        no_italic = false;
        no_underline = false;
        transparent_background = true;
        integrations = {
          cmp = true;
          notify = true;
          gitsigns = true;
          neotree = true;
          which_key = true;
          illuminate = {
            enabled = true;
            lsp = true;
          };
          navic = {
            enabled = true;
            custom_bg = "NONE";
          };
          treesitter = true;
          telescope.enabled = true;
          indent_blankline.enabled = true;
          mini = {
            enabled = true;
            indentscope_color = "rosewater";
          };
          native_lsp = {
            enabled = true;
            inlay_hints = {
              background = true;
            };
            virtual_text = {
              errors = [ "italic" ];
              hints = [ "italic" ];
              information = [ "italic" ];
              warnings = [ "italic" ];
              ok = [ "italic" ];
            };
            underlines = {
              errors = [ "underline" ];
              hints = [ "underline" ];
              information = [ "underline" ];
              warnings = [ "underline" ];
            };
          };
        };
      };
    };
  };
}
