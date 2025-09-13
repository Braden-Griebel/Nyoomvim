{lib, ...}: {
  plugins.noice = {
    enable = true;
    settings = {
      presets = {
        bottom_search = false;
        command_palette = true;
        inc_rename = true;
        long_message_to_split = true;
        lsp_doc_border = true;
      };
      lsp = lib.nixvim.mkRaw ''
            {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            -- ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
          },
        }
      '';
    };
  };
}
