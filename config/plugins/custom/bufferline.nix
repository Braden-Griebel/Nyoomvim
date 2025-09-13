{
  plugins.bufferline.enable = true;
  keymaps = [
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bdelete<cr>";
      options.desc = "Delete Buffer";
    }
    {
      key = "<leader>bp";
      action = "<Cmd>BufferLineTogglePin<CR>";
      options.desc = "Toggle Pin";
    }
    {
      key = "<leader>bP";
      action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
      options.desc = "Delete Non-Pinned Buffers";
    }
    {
      key = "<leader>br";
      action = "<Cmd>BufferLineCloseRight<CR>";
      options.desc = "Delete Buffers to the Right";
    }
    {
      key = "<leader>bl";
      action = "<Cmd>BufferLineCloseLeft<CR>";
      options.desc = "Delete Buffers to the Left";
    }
    {
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options.desc = "Prev Buffer";
    }
    {
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options.desc = "Next Buffer";
    }
    {
      key = "[b";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options.desc = "Prev Buffer";
    }
    {
      key = "]b";
      action = "<cmd>BufferLineCycleNext<cr>";
      options.desc = "Next Buffer";
    }
    {
      key = "[B";
      action = "<cmd>BufferLineMovePrev<cr>";
      options.desc = "Move buffer prev";
    }
    {
      key = "]B";
      action = "<cmd>BufferLineMoveNext<cr>";
      options.desc = "Move buffer next";
    }
    {
      mode = "n";
      key = "<leader>bb";
      action = "<cmd>e #<cr>";
      options.desc = "Switch to Other Buffer";
    }
  ];
}
