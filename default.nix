{ lib, stdenv, pkgs, fetchurl }:
stdenv.mkDerivation (finalAttrs: {
  pname = "rose-pine-cursor-hyprcursor";
  version = "0.1.0";
  src = pkgs.fetchFromGitHub {
    owner = "ndom91";
    repo = "rose-pine-cursor-hyprcursor";
    rev = "e4dde6d19da2d048cf4b224fe2ed1576c9c50087";
    sha256 = "sha256-h7qivaCqoJj1ZbWT86WA1gp769vgTUhDDxcJOZ1WfMU=";
  };

  installPhase = ''
    mkdir -p $out/share/icons/rose-pine-cursor-hyprcursor
    cp -R . $out/share/icons/rose-pine-cursor-hyprcursor/
  '';

  meta = with lib; {
    description = "Soho vibes for Cursors";
    downloadPage = "https://github.com/ndom91/rose-pine-cursor-hyprcursor/releases";
    homepage = "https://rosepinetheme.com/";
    license = licenses.gpl3;
    maintainers = with maintainers; [ ndom91 ];
  };
})
