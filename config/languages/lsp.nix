{
  config,
  pkgs,
  lib,
  ...
}: {
  plugins = {
    lsp-lines.enable = true;
    lsp-format.enable = true;
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true; # bash
        clangd.enable = true; # c,c++
        cmake.enable = true; # cmake
        cssls.enable = true; # CSS
        emmet_language_server.enable = true; # HTML snipets
        eslint.enable = true; # Javascript/Typescript linting
        fish_lsp.enable = true; # Fish shell
        fortls.enable = true; # FORTRAN lsp
        gopls.enable = true; # Go lang lsp
        html.enable = true; # HTML lsp
        jsonls.enable = true; # JSON
        lua_ls.enable = true; # Lua
        marksman.enable = true; # Markdown
        neocmake.enable = true; # CMake snipets
	nil_ls.enable = true; # Nix lsp
        ocamllsp.enable = true; # Ocaml language server
        pyright.enable = true; # Python Lanugage Server
        ruff.enable = true; # Python linter/formater
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        }; # Rust lsp
        ts_ls.enable = true; # Typescript lsp
        zls.enable = true; # Zig lsp
      };
    };
  };
  lsp = {
    inlayHints.enable = true;
    keymaps = [
      {
        key = "gd";
        lspBufAction = "definition";
      }
      {
        key = "gD";
        lspBufAction = "references";
      }
      {
        key = "gt";
        lspBufAction = "type_definition";
      }
      {
        key = "gi";
        lspBufAction = "implementation";
      }
      {
        key = "K";
        lspBufAction = "hover";
      }
      {
        action = lib.nixvim.mkRaw "function() vim.diagnostic.jump({ count=-1, float=true }) end";
        key = "<leader>k";
      }
      {
        action = lib.nixvim.mkRaw "function() vim.diagnostic.jump({ count=1, float=true }) end";
        key = "<leader>j";
      }
      {
        action = "<CMD>LspStop<Enter>";
        key = "<leader>lx";
      }
      {
        action = "<CMD>LspStart<Enter>";
        key = "<leader>ls";
      }
      {
        action = "<CMD>LspRestart<Enter>";
        key = "<leader>lr";
      }
      {
        action = lib.nixvim.mkRaw "require('telescope.builtin').lsp_definitions";
        key = "gd";
      }
      {
        action = "<CMD>Lspsaga hover_doc<Enter>";
        key = "K";
      }
    ];
  };
}
