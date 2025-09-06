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
    "ftplugin/rmd.lua" = {
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
    "ftplugin/python.lua" = {
      opts = {
        expandtab = true;
        tabstop = 4;
        shiftwidth = 4;
      };
    };
    "ftplugin/c.lua" = {
      opts = {
        expandtab = true;
        tabstop = 2;
        shiftwidth = 2;
      };
    };
    "ftplugin/cpp.lua" = {
      opts = {
        expandtab = true;
        tabstop = 2;
        shiftwidth = 2;
      };
    };
  };
}
