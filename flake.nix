{
  description = "Neovim configuration in nix using nixvim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = {
    self,
    nixpkgs,
    flake-parts,
    nixvim,
    ...
  } @ inputs:
    flake-parts.lib.mkflake {inherit inputs;} {
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
        nixvim' = nixvim.laegacyPackages.${system};
        nixvimModule = {
          inherit pkgs;
          module = import ./config;
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
      in {
        packages = {default = nvim;};
      };

      flake = {
      };
    };
}
