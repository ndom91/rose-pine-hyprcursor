{
  description = "Rose Pine themed BreezeX Cursor for Hyprcursor";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";

    hyprlang = {
      url = "github:hyprwm/hyprlang";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, utils, hyprlang } @inputs:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages.default = pkgs.callPackage ./nix/default.nix { nixpkgs = pkgs; };

        nixosModules.default = { config, lib, ... }: {
          config = {
            home.pointerCursor = {
              gtk.enable = true;
              x11.enable = true;
              package = self.defaultPackage."${system}";
              name = "rose-pine-hyprcursor";
              size = 24;
            };
            gtk.cursorTheme = {
              package = self.defaultPackage."${system}";
              name = "rose-pine-hyprcursor";
              size = 24;
            };
          };
        };

        formatter = nixpkgs.${system}.nixpkgs-fmt;
      });
}
