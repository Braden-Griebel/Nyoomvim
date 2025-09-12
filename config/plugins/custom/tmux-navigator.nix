{
  plugins.tmux-navigator = {
    enable = true;
    settings.no_mappings = 1;
    # keymaps = [
    #   {
    #     action = "left";
    #     key = "<C-h>";
    #   }
    #   {
    #     action = "down";
    #     key = "<C-j>";
    #   }
    #   {
    #     action = "up";
    #     key = "<C-k>";
    #   }
    #   {
    #     action = "right";
    #     key = "<C-l>";
    #   }
    # ];
  };
  keymaps = [
    {
      mode = "n";
      key = "<c-h>";
      action = "<cmd>TmuxNavigateLeft<cr>";
      options.desc = "Tmux go left";
    }
    {
      mode = "n";
      key = "<c-j>";
      action = "<cmd>TmuxNavigateDown<cr>";
      options.desc = "Tmux go down";
    }
    {
      mode = "n";
      key = "<c-k>";
      action = "<cmd>TmuxNavigateUp<cr>";
      options.desc = "Tmux go up";
    }
    {
      mode = "n";
      key = "<c-l>";
      action = "<cmd>TmuxNavigateRight<cr>";
      options.desc = "Tmux go right";
    }
  ];
}
