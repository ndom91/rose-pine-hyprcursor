{ lib, stdenvNoCC, fetchurl }:
stdenv.mkDerivation (finalAttrs: {
  pname = "rose-pine-cursor-hyprcursor";
  version = "0.1.0";
  src = fetchFromGitHub {
    owner = "ndom91";
    repo = "rose-pine-cursor-hyprcursor";
    rev = "f96a8e09fa7e60d5e48543e15693774dcf092fbe";
    sha256 = "sha256-CPK3kbc8lroPU8MAeNP8JSStzDCKCvAHhj6yQ1fWKkY=";
  };

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/share/icons
    cp -R rose-pine-cursor-hyprcursor $out/share/icons/
  '';

  meta = with lib; {
    description = "Soho vibes for Cursors";
    downloadPage = "https://github.com/ndom91/rose-pine-cursor-hyprcursor/releases";
    homepage = "https://rosepinetheme.com/";
    license = licenses.gpl3;
    maintainers = with maintainers; [ ndom91 ];
  };
})
