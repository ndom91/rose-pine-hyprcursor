{ lib, stdenv, nixpkgs, fetchurl }:
stdenv.mkDerivation (finalAttrs: {
  pname = "rose-pine-hyprcursor";
  version = "0.1.0";
  src = nixpkgs.fetchFromGitHub {
    owner = "ndom91";
    repo = "rose-pine-hyprcursor";
    rev = "a233b19c79598f6703dd112cf4e06c61e40833aa";
    sha256 = "sha256-QD7XSoQnDspqEVcRfI87zmxjcvtU17MAXYhaCeMY5Ls=";
  };

  installPhase = ''
    mkdir -p $out/share/icons/rose-pine-hyprcursor
    cp -R . $out/share/icons/rose-pine-hyprcursor/
  '';

  meta = with lib; {
    description = "Soho vibes for Cursors";
    downloadPage = "https://github.com/ndom91/rose-pine-hyprcursor/releases";
    homepage = "https://rosepinetheme.com/";
    license = licenses.gpl3;
    maintainers = with maintainers; [ ndom91 ];
  };
})
