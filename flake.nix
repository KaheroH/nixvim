{
  description = "Neovim configuration in nix using nixvim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixvim.url = "github:nix-community/nixvim";
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
    };
  };

  outputs = {
    nixpkgs,
    flake-parts,
    pre-commit-hooks,
    nixvim,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [];

      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: let
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = {
          inherit pkgs;
          module = import ./config;
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
      in {
        checks = {
          default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
          pre-commit-checks = pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
            };
          };
        };

        formatter = pkgs.nixfmt-rfc-style;
        packages = {
          default = nvim;
        };
        devShells = {
          default = with pkgs; mkShell {inherit (self'.checks.pre-commit-checks) shellHook;};
        };
      };
    };
}
