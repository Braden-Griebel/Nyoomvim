{
  plugins.toggleterm = {
    enable = true;
    settings = {
      open_mapping = "[[<c-\\>]]";
      hide_numbers = true;
      shell = "fish";
      direction = "horizontal";
      size = 20;
    };
  };
  keymaps = [
    {
      mode = ["n"];
      key = "<c-\\>";
      action = "<cmd>ToggleTerm name=<cr>";
      options.desc = "Toggle Terminal";
    }
  ];
}
