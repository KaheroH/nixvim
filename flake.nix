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

  outputs =
    {
      nixpkgs,
      flake-parts,
      pre-commit-hooks,
      nixvim,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } ( { withSystem, ...}:
      let
        systems = [
          "x86_64-linux"
          "aarch64-linux"
          "aarch64-darwin"
          "x86_64-darwin"
        ];
      in {
        inherit systems;

        debug = true;
        perSystem =
          {
            config,
            self',
            inputs',
            pkgs,
            system,
            ...
          }:
          let
            nixvimLib = nixvim.lib.${system};
            nixvim' = nixvim.legacyPackages.${system};
            nixvimModule = {
              inherit pkgs;
              module = import ./config;
            };
            nvim = nixvim'.makeNixvimWithModule nixvimModule;
          in
          {

            checks = {
              default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
              pre-commit-checks = pre-commit-hooks.lib.${system}.run {
                src = ./.;
                hooks = {
                  nixfmt-rfc-style.enable = true;
                };
              };
            };

            formatter = pkgs.nixfmt-rfc-style;
            packages = {
              default = nvim;
            };
            devShells = {
              default = with pkgs; mkShell { inherit (self'.checks.pre-commit-checks) shellHook; };
            };
          };
        flake = {  # <-- plain attrset now, no need for a function
          bundlers = builtins.listToAttrs (map (system: {
            name = system;
            value.tarball = withSystem system ({ pkgs, ... }: drv:
              pkgs.runCommand "${drv.name}-tarball" {} ''
                mkdir -p $out
                tar -czf $out/${drv.name}.tar.gz -C ${drv} .
              ''
            );
          }) systems);
        };
      });
}
