{
  plugins.lsp = {
    enable = true;
    inlayHints = true;
    keymaps = {
      diagnostic = {
        "]d" = "goto_next";
        "[d" = "goto_prev";
      };
      lspBuf = {
        "K" = "hover";
        "gd" = "definition";
        "gD" = "declaration";
        "gr" = "references";
        "gI" = "implementation";
        "gy" = "type_definition";
        "gK" = "signature_help";
        "<leader>ca" = "code_action";
        "<leader>cA" = "source_action";
        "<leader>cc" = "codelens";
        "<leader>cr" = "rename";
        "]]" = "goto_next";
        "[[" = "goto_prev";
        "<a-n>" = "goto_next";
        "<a-p>" = "goto_prev";
      };
    };
    preConfig = ''
      vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        float = {
          border = 'rounded',
          source = 'always',
        },
      })

      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
        vim.lsp.handlers.hover,
        {border = 'rounded'}
      )

      vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        {border = 'rounded'}
      )
    '';
    postConfig = ''
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
    '';
    servers = {
      jsons.enable = true;
      marksman.enable = true;
      nil_ls.enable = true;
      nixd.enable = true;
      yamlls.enable = true;
      taplo.enable = true;
    };
  };
}
