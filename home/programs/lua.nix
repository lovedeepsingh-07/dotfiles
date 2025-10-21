{ ... }@inputs: {
  pkg = inputs.pkgs.stdenv.mkDerivation rec {
    pname = "lua-pkg";
    version = "5.1.5";
    src = inputs.pkgs.fetchurl {
      url = "https://www.lua.org/ftp/lua-${version}.tar.gz";
      sha256 = "sha256-JkD8VqeV8p0o7xXhPDSkfiI5YLAkDoywqC2bBzhpUzM=";
    };
    nativeBuildInputs =
      [ inputs.pkgs.makeWrapper inputs.pkgs.pkg-config inputs.pkgs.readline ];
    buildInputs = [ ];

    configurePhase = "make linux";
    installPhase = ''
      		mkdir -p $out/bin $out/include $out/lib
      		cp src/lua src/luac $out/bin/
              cp src/lua.h src/lualib.h src/lauxlib.h src/luaconf.h $out/include/
              cp src/liblua.a $out/lib/
      	'';
  };
}
