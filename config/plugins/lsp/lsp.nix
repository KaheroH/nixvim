{ inputs, pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    ansible-vim
    vim-puppet
  ];

  plugins = {
    lsp-lines = {
      enable = true;
    };
    lsp-format = {
      enable = true;
    };
    helm = {
      enable = true;
    };
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        rust_analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
        roslyn_ls.enable = true;
        puppet = {
          enable = true;
          package = pkgs.vimPlugins.vim-puppet;
        };
        powershell_es = {
          enable = true;
          package = pkgs.powershell-editor-services;
        };
        html.enable = true;
        lua_ls.enable = true;
        nixd = {
          enable = true;
          settings =
            let
              # The wrapper curries `_nixd-expr.nix` with the `self` and `system` args
              # This makes `init.lua` a bit DRYer and more readable
              wrapper = builtins.toFile "expr.nix" ''
                import ${./_nixd-expr.nix} {
                  system = ${builtins.toJSON pkgs.stdenv.hostPlatform.system};
                }
              '';
              # withFlakes brings `local` and `global` flakes into scope, then applies `expr`
              withFlakes = expr: "with import ${wrapper}; " + expr;
            in
            {
              nixpkgs.expr = withFlakes ''
                import (if local ? lib.version then local else local.inputs.nixpkgs or global.inputs.nixpkgs) { }
              '';
              options = rec {
                # flake-parts.expr = withFlakes "local.debug.options or global.debug.options";
                # nixos.expr = withFlakes "global.nixosConfigurations.desktop.options";
                # home-manager.expr = "${nixos.expr}.home-manager.users.type.getSubOptions [ ]";
                # nixvim.expr = withFlakes "global.nixvimConfigurations.\${system}.default.options";
              };
              diagnostic = {
                # Suppress noisy warnings
                suppress = [
                  "sema-escaping-with"
                  "var-bind-to-this"
                ];
              };
            };
        };
        nushell.enable = true;
        ts_ls.enable = true;
        marksman.enable = true;
        pyright.enable = true;
        gopls.enable = true;
        terraformls.enable = true;
        jsonls.enable = true;
        helm_ls = {
          enable = true;
          extraOptions = {
            settings = {
              helm_ls = {
                yamlls = {
                  path = "${pkgs.yaml-language-server}/bin/yaml-language-server";
                };
              };
            };
          };
        };
        yamlls = {
          enable = true;
          extraOptions = {
            settings = {
              yaml = {
                schemes = {
                  kubernetes = "'*.yaml";
                  "http://json.schemastore.org/github-workflow" = ".github/workflows/*";
                  "http://json.schemastore.org/github-action" = ".github/action.{yml,yaml}";
                  "http://json.schemastore.org/ansible-stable-2.9" = "roles/tasks/*.{yml,yaml}";
                  "http://json.schemastore.org/kustomization" = "kustomization.{yml,yaml}";
                  "http://json.schemastore.org/ansible-playbook" = "*play*.{yml,yaml}";
                  "http://json.schemastore.org/chart" = "Chart.{yml,yaml}";
                  "https://json.schemastore.org/dependabot-v2" = ".github/dependabot.{yml,yaml}";
                  "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" =
                    "*docker-compose*.{yml,yaml}";
                  "https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json" =
                    "*flow*.{yml,yaml}";
                };
              };
            };
          };
        };
      };

      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>ld" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "]d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "[d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };

  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';
}
