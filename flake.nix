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
        environment.variables = {
          HYPRCURSOR_THEME = "rose-pine-hyprcursor";
        };

        formatter = nixpkgs.${system}.nixpkgs-fmt;
      });
}
