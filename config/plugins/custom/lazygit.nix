{
  plugins.lazygit = {
    enable = true;
  };
  keymaps = [
    {
      mode = ["n"];
      key = "<leader>gl";
      action = "<cmd>LazyGit<cr>";
      options.desc = "LazyGit";
    }
  ];
}
