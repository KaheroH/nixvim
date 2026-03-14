{ lib, ... }:
{
  plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        appearance = {
          nerd_font_variant = "normal";
          use_nvim_cmp_as_default = true;
        };
        fuzzy = {
          sorts = [
            "exact"
            "score"
            "sort_text"
          ];
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
            selection = {
              preselect = false;
              auto_insert = true;
            };
          };

          menu = {
            border = "rounded";
            draw = {
              components = {
                kind_icon = {
                  text = lib.nixvim.mkRaw ''
                    function(ctx)
                      if ctx.source_name ~= "Path" then
                        return require("lspkind").symbol_map[ctx.kind] or "" .. ctx.icon_gap
                      end

                      local is_unknown_type = vim.tbl_contains({ "link", "socket", "fifo", "char", "block", "unknown" }, ctx.item.data.type)
                      local mini_icon, _ = require("mini.icons").get(
                        is_unknown_type and "os" or ctx.item.data.type,
                        is_unknown_type and "" or ctx.label
                      )

                      return (mini_icon or ctx.kind_icon) .. ctx.icon_gap
                    end
                  '';

                  highlight = lib.nixvim.mkRaw ''
                    function(ctx)
                      if ctx.source_name ~= "Path" then return ctx.kind_hl end

                      local is_unknown_type = vim.tbl_contains({ "link", "socket", "fifo", "char", "block", "unknown" }, ctx.item.data.type)
                      local mini_icon, mini_hl = require("mini.icons").get(
                        is_unknown_type and "os" or ctx.item.data.type,
                        is_unknown_type and "" or ctx.label
                      )
                      return mini_icon ~= nil and mini_hl or ctx.kind_hl
                    end
                  '';
                };
              };
            };
          };
        };
        keymap = {
          preset = "default";
          "[\"<Up>\"]" = [
            "select_prev"
            "fallback"
          ];
          "[\"<Tab>\"]" = [
            (lib.nixvim.mkRaw ''
              function(cmp)
                if has_words_before() then
                  return cmp.insert_next()
                end
              end
            '')
            "fallback"
          ];
          "[\"<S-Tab>\"]" = [ "insert_prev" ];
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
            lsp = { };
            snippets = { };
          };
        };
      };
    };

    blink-pairs.enable = true;

  };
}
