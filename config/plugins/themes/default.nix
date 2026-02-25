{
  colorschemes = {
    rose-pine = {
      enable = false;

      settings = {
        before_highlight = ''
          function(highlights)
            return {
              CursorLineNr = { fg = highlights.peach, style = {} },
              NavicText = { fg = highlights.text },
            }
          end
        '';
        extend_background_behind_borders = true;
        groups = {
          border = "muted";
          link = "iris";
          panel = "surface";
        };
        styles = {
          transparency = true;
        };
      };
    };

    kanagawa-paper = {
      enable = true;
      settings = {
        auto_plugins = false;
        diag_background = true;
        gutter = false;
        styles = {
          comments = {
            italic = true;
          };
          functions = {
            italic = true;
            bold = true;
          };
          keywords = {
            italic = true;
            bold = true;
          };
          statement_type = {
            bold = true;
          };
          type = {
            bold = true;
          };
        };
        theme = "ink";
        transparent = true;
        color_balance = {
          ink = {
            brightness = 0;
            saturation = 0.4;
          };
        };
      };
    };
  };
}
