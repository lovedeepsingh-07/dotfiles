{ pkgs, ... }:
let
  font-src = pkgs.fetchzip {
    url =
      "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip";
    sha256 = "sha256-251gsTXXmfYO+ibrCuWqPtFeYrdokPMOoh2jIx0/RgM=";
    stripRoot = false;
  };
  font-patcher-src = pkgs.fetchzip {
    url =
      "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FontPatcher.zip";
    sha256 = "sha256-koZj0Tn1HtvvSbQGTc3RbXQdUU4qJwgClOVq1RXW6aM=";
    stripRoot = false;
  };
in pkgs.stdenv.mkDerivation rec {
  pname = "JetBrainsMonoNLNerdFontComplete";
  version = "1.0";
  src = pkgs.symlinkJoin {
    name = "combined-src";
    paths = [ font-src font-patcher-src ];
  };

  nativeBuildInputs = [ pkgs.fontforge ];
  buildPhase = ''
    fontforge -script font-patcher -c --name ${pname} ./JetBrainsMonoNLNerdFont-Regular.ttf
  '';
  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    cp ./${pname}-Regular.ttf $out/share/fonts/truetype/
  '';
}
