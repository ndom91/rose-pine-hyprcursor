{
  description = "Rose Pine themed BreezeX Cursor for Hyprcursor";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    hyprlang = {
      url = "github:hyprwm/hyprlang";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, hyprlang }:
    let
      genSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
      ];
      pkgsFor = nixpkgs.legacyPackages;
      rose-pine-cursor-hyprcursor = nixpkgs.callPackage ./nix/default.nix { };
    in
    {
      overlays.default = _: prev: {
        rose-pine-cursor-hyprland = prev.callPackage ./nix/default.nix { nixpkgs = prev; };
      };

      packages = genSystems (system: self.overlays.default null pkgsFor.${system});

      modules = [
        ({ lib, ... }: {
          home.pointerCursor = {
            gtk.enable = true;
            x11.enable = true;
            package = rose-pine-cursor-hyprcursor;
            name = "rose-pine-cursor-hyprcursor";
            size = 24;
          };
          gtk.cursorTheme = {
            package = rose-pine-cursor-hyprcursor;
            name = "rose-pine-cursor-hyprcursor";
            size = 24;
          };
        })
      ];

      formatter = genSystems (system: pkgsFor.${system}.nixpkgs-fmt);
    };
}
