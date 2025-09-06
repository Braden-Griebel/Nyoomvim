{
  files = {
    "ftplugin/r.lua" = {
      opts = {
        expandtab = true;
        tabstop = 2;
        shiftwidth = 2;
      };
      keymaps = [
        {
          mode = "i";
          key = "<A-->";
          action = "<-";
          options = {
            desc = "Insert R assignment";
            buffer = true;
            remap = true;
          };
        }
        {
          mode = "i";
          key = "<C-,>";
          action = "|>";
          options = {
            desc = "Insert R pipe";
            buffer = true;
            remap = true;
          };
        }
      ];
    };
  };
}
