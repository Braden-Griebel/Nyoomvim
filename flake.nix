{
  description = "Neovim Configuration Flake using NVF";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { nixpkgs, home-manager, nvf, ... }: 
  let 
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    configModule = {
      # Add any custom options (and do feel free to upstream them!)
      # options = { ... };

      config.vim = {
        theme.enable = true;
        # and more options as you see fit...
      };
    };

    nyoomvim = nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = [configModule];
    };
  in 
  {
    # This will make the package available as a flake output under 'packages'
    packages.${system}.default = nyoomvim.neovim;
    nixosModules.default = nyoomvim.neovim;
  };
}
