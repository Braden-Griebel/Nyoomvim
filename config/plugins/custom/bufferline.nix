{
  plugins.bufferline.enable = true;
  keymaps = [
    {
      mode = "n";
      key = "<leader>bb";
      action = "<cmd>e #<cr>";
      options.desc = "Switch to Other Buffer";
    }
  ];
}
