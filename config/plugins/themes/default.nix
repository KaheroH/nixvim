{
  colorschemes = {
    rose-pine = {
      enable = true;

      settings = {
        before_highlight = ''
          function(highlights)
            return {
              CursorLineNr = { fg = highlights.peach, style = {} },
              NavicText = { fg = highlights.text },
            }
          end
        '';
        dark_variant = "moon";
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
  };
}
