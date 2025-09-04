{ pkgs, ... }: {
  dependencies = {
    fzf.enable = true;
    git.enable = true;
    ripgrep.enable = true;
  };
  extraPackages = with pkgs; [ ruff shfmt ];
}
