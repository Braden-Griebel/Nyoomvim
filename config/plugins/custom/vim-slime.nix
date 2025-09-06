{
  plugins.vim-slime = {
    enable = true;
    settings = {
      target = "tmux";
      bracketed_paste = 1;
      default_config = {
        socket_name = "default";
        target_pane = "{last}";
      };
      no_mappings = 1;
    };
  };
  keymaps = [
    {
      mode = [ "n" ];
      key = "gz";
      action = "<Plug>SlimeMotionSend";
      options = {
        remap = true;
        silent = false;
        desc = "Slime Send Motion";
      };
    }
    {
      mode = [ "n" ];
      key = "gzz";
      action = "<Plug>SlimeLineSend";
      options = {
        remap = true;
        silent = false;
        desc = "Slime Send Line";
      };
    }
    {
      mode = [ "x" ];
      key = "gz";
      action = "<Plug>SlimeRegionSend";
      options = {
        remap = true;
        silent = false;
        desc = "Slime Send Region";
      };
    }
    {
      mode = [ "n" ];
      key = "gzc";
      action = "<Plug>SlimeConfig";
      options = {
        remap = true;
        silent = false;
        desc = "Slime Config";
      };
    }
  ];
}
