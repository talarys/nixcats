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
              bash-language-server
              basedpyright
              biome
              clang-tools
              vscode-langservers-extracted
              gleam
              gopls
              # haskellPackages.hls
              just-lsp
              nixd
              nushell
              rust-analyzer
              tailwindcss
              zls

              stylua
              shfmt
              ruff
            ];
          };

          startupPlugins = {
            general = with pkgs.vimPlugins; [
              flash-nvim
              smart-splits-nvim
              snacks-nvim
              todo-comments-nvim
              which-key-nvim
              nvim-treesitter.withAllGrammars
              gitsigns-nvim
              which-key-nvim
              nvim-lint
              conform-nvim
              stay-centered-nvim
              nvim-lspconfig
              conform-nvim
            ];

            ui = with pkgs.vimPlugins; [
              nvim-web-devicons
              lualine-nvim
              lualine-lsp-progress
              catppuccin-nvim
              colorizer
              noice-nvim
            ];

            mini = with pkgs.vimPlugins; [
              mini-ai
              mini-comment
              mini-completion
              mini-move
              mini-operators
              mini-pairs
              mini-splitjoin
              mini-snippets
              mini-surround
              mini-bracketed
              mini-starter
              mini-indentscope
            ];
          };

          optionalPlugins = {
            general = with pkgs.vimPlugins; [
              lazydev-nvim
            ];
          };

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
              ui = true;
              mini = true;
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
