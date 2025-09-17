{
  plugins.aerial = {
    enable = true;
    settings = {
      attach_mode = "global";
      backends = [
        "treesitter"
        "lsp"
        "markdown"
        "man"
      ];
      disable_max_lines = 5000;
      highlight_on_hover = true;
      ignore = {
        filetypes = [
          "gomod"
        ];
      };
    };
  };
  keymaps = [
    {
      key = "<leader>co";
      action = "<cmd>AerialToggle<cr>";
      options.desc = "Aerial [O]utline";
      mode = "n";
    }
  ];
}
