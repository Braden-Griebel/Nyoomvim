{lib, ...}: {
  plugins.inc-rename = {
    enable = true;
  };
  keymaps = [
    {
      key = "<leader>cr";
      action = lib.nixvim.mkRaw ''
        function()
          return ':IncRename ' .. vim.fn.expand '<cword>'
        end
      '';
      options = {
        desc = "Rename Symbol";
        expr = true;
      };
      mode = ["n"];
    }
  ];
}
