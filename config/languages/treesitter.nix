{pkgs, ...}: {
  plugins.treesitter = {
    enable = true;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      c
      cpp
      fish
      go
      haskell
      javascript
      nix
      ocaml
      python
      rust
      typescript
      zig
    ];

    settings = {
      highlight.enable = true;
      textobjects.enable = true;
      incremental_selection.enable = true;
      indent.enable = true;
    };
  };
}
