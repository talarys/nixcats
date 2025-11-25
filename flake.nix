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
              haskell-language-server
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
              blink-cmp
              conform-nvim
              flash-nvim
              gitsigns-nvim
              nvim-lint
              nvim-lspconfig
              nvim-treesitter.withAllGrammars
              smart-splits-nvim
              snacks-nvim
              stay-centered-nvim
              todo-comments-nvim
              lazydev-nvim
              which-key-nvim
              trouble-nvim
              friendly-snippets
              lspsaga-nvim
            ];

            ui = with pkgs.vimPlugins; [
              catppuccin-nvim
              nvim-colorizer-lua
              lualine-lsp-progress
              lualine-nvim
              noice-nvim
              nvim-web-devicons
              bufferline-nvim
            ];

            mini = with pkgs.vimPlugins; [
              mini-ai
              mini-bracketed
              mini-comment
              mini-completion
              mini-indentscope
              mini-move
              mini-operators
              mini-pairs
              mini-snippets
              mini-splitjoin
              mini-starter
              mini-surround
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
        neovim =
          { pkgs, name, ... }:
          {
            settings = {
              suffix-path = true;
              suffix-LD = true;
              aliases = [
                "vim"
                "nvim"
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

      defaultPackageName = "neovim";
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
