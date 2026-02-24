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
        background = "dark";
        cache = false;
        colors = {
          palette = { };
          theme = {
            canvas = { };
            ink = { };
          };
        };
        compile = false;
        dim_inactive = false;
        gutter = false;
        styles = {
          comments = {
            italic = true;
          };
          functions = {
            italic = true;
          };
          keywords = {
            italic = true;
          };
          statement_style = {
            bold = true;
          };
        };
        terminal_colors = false;
        theme = "ink";
        transparent = true;
        undercurl = true;
      };
    };
  };
}
