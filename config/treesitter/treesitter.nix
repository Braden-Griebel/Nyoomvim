{ lib, ... }: {
  plugins.treesitter = {
    enable = true;
    folding = true;
    settings = {
      highlight.enable = true;
      indent.enable = true;
      ensure_installed = "all";
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = "<C-space>";
          node_incremental = "<C-space>";
          scope_incremental = false;
          node_decremental = "<bs>";
        };
        textobjects = {
          move = {
            enable = true;
            goto_next_start = lib.nixvim.mkRaw ''
              { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" }'';
            goto_next_end = lib.nixvim.mkRaw ''
              { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" }'';
            goto_previous_start = lib.nixvim.mkRaw ''
              { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" }'';
            goto_previous_end = lib.nixvim.mkRaw ''
              { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" }'';
          };
        };
      };
    };
  };
}
