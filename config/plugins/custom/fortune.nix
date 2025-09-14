{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    fortune-nvim
  ];
  extraConfigLua = ''
    require('fortune').setup({
      max_width = 60,
      display_format = "mixed",
      content_type = "quotes",
      language="en",
    })
  '';
}
