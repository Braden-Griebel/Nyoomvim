{ lib, pkgs, ... }: {
  plgugins.conform = {
    enable = true;
    settings = {
      default_format_opts = {
        timeout_ms = 3000;
        async = false;
        quiet = false;
        lsp_format = "fallback";
      };
      formatters_by_ft = {
        lua = [ "stylua" ];
        fish = [ "fish_indent" ];
        sh = [ "shfmt" ];
      };
      formatters = {
        shfmt = { command = lib.getExe pkgs.shfmt; };
        lua = { command = lib.getExe pkgs.luastyle; };
        injected = { options = { ignore_errors = true; }; };
      };
    };
  };
}
