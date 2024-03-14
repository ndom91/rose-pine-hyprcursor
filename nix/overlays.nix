{ lib, inputs, nixpkgs }:
let
  mkDate = longDate: (lib.concatStringsSep "-" [
    (builtins.substring 0 4 longDate)
    (builtins.substring 4 2 longDate)
    (builtins.substring 6 2 longDate)
  ]);
in
{
  default = inputs.self.overlays.rose-pine-cursor-hyprcursor;

  rose-pine-cursor-hyprcursor = lib.composeManyExtensions [
    inputs.hyprlang.overlays.default
    (final: prev: {
      rose-pine-cursor-hyprcursor = prev.callPackage ./default.nix {
        version = "v0.2.0" + "+date=" + (mkDate (inputs.self.lastModifiedDate or "19700101")) + "_" + (inputs.self.shortRev or "dirty");
        inherit (final) nixpkgs hyprlang;
      };
    })
  ];
}
