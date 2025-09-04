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
  };
}
