{
  description = "Rose Pine themed BreezeX Cursor for Hyprcursor";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default-linux";

    hyprlang = {
      url = "github:hyprwm/hyprlang";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, systems, ... } @ inputs:
    let
      inherit (nixpkgs) lib;
      eachSystem = lib.genAttrs (import systems);
      pkgsFor = eachSystem (system:
        import nixpkgs {
          localSystem.system = system;
          overlays = with self.overlays; [ default ];
        });
    in
    {
      overlays = import ./nix/overlays.nix { inherit inputs lib nixpkgs; };

      packages = eachSystem (system: {
        default = self.packages.${system}.rose-pine-cursor-hyprcursor;
        inherit (pkgsFor.${system}) rose-pine-cursor-hyprcursor;
      });

      formatter = eachSystem (system: pkgsFor.${system}.nixpkgs-fmt);

      config = {
        environment.systemPackages = [
          rose-pine-cursor-hyprcursor
        ];
        home.pointerCursor = {
          gtk.enable = true;
          x11.enable = true;
          package = rose-pine-cursor-hyprcursor;
          name = "rose-pine-cursor-hyprcursor";
          size = 24;
        };
        gtk.cursorTheme = {
          package = rose-pine-cursor;
          name = "rose-pine-cursor-hyprcursor";
          size = 24;
        };
      };
    };
}
