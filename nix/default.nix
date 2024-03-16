{ lib, stdenv, nixpkgs, fetchurl }:
stdenv.mkDerivation (finalAttrs: {
  pname = "rose-pine-hyprcursor";
  version = "0.1.0";
  src = nixpkgs.fetchFromGitHub {
    owner = "ndom91";
    repo = "rose-pine-hyprcursor";
    rev = "e4dde6d19da2d048cf4b224fe2ed1576c9c50087";
    sha256 = "sha256-tTYD2JQ9+7A7wzEZtAI6RCec/2ULdSZJvbKyOWIKes0=";
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
