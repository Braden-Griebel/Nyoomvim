{
  plugins = {
    vim-slime = {
      enable = true;
      settings = {
        slime_target = "tmux";
        sime_bracketed_paste = 1;
        default_config = {
          socket_name = "vim.fn.split(vim.env.TMUX, ',')[1]";
          target_pane = ":.2";
        };
      };
    };
  };
}
