{
  description = "A Lua-natic's neovim flake, with extra cats! nixCats!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixCats.url = "github:BirdeeHub/nixCats-nvim";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      inherit (inputs.nixCats) utils;

      luaPath = ./.;

      forEachSystem = utils.eachSystem nixpkgs.lib.platforms.all;

      categoryDefinitions =
        {
          pkgs,
          settings,
          categories,
          extra,
          name,
          mkPlugin,
          ...
        }:
        {
          lspsAndRuntimeDeps = {
            general = with pkgs; [
              lua-language-server
              stylua
            ];
          };

          startupPlugins = {
            general = with pkgs.vimPlugins; [
              snacks-nvim
              smart-splits-nvim
              flash-nvim
              nvim-web-devicons
              blink-cmp
              nvim-treesitter.withAllGrammars
              lualine-nvim
              lualine-lsp-progress
              gitsigns-nvim
              which-key-nvim
              nvim-lint
              conform-nvim
              stay-centered-nvim
            ];
          };

          optionalPlugins = {
            general = with pkgs.vimPlugins; [
              lazydev-nvim
            ];
          };

          themer =
            with pkgs.vimPlugins;
            (builtins.getAttr (categories.colorscheme or "catppuccin") {
              "onedark" = onedark-nvim;
              "catppuccin" = catppuccin-nvim;
              "catppuccin-mocha" = catppuccin-nvim;
              "tokyonight" = tokyonight-nvim;
              "tokyonight-day" = tokyonight-nvim;
            });

          python3.libraries = {
            test = (_: [ ]);
          };

          extraLuaPackages = {
            general = [ (_: [ ]) ];
          };
        };

      packageDefinitions = {
        nixCats =
          { pkgs, name, ... }:
          {
            settings = {
              suffix-path = true;
              suffix-LD = true;
              aliases = [
                "vim"
                "vimcat"
              ];
              wrapRc = true;
              configDirName = "nixCats-nvim";
              hosts.python3.enable = true;
              hosts.node.enable = true;
            };
            categories = {
              general = true;
              themer = true;
              colorscheme = "catppuccin-mocha";
            };
            extra = { };
          };
      };

      defaultPackageName = "nixCats";
    in
    forEachSystem (
      system:
      let
        nixCatsBuilder = utils.baseBuilder luaPath {
          inherit
            nixpkgs
            system
            ;
        } categoryDefinitions packageDefinitions;

        defaultPackage = nixCatsBuilder defaultPackageName;
      in
      {
        packages = utils.mkAllWithDefault defaultPackage;
      }
    );
}
