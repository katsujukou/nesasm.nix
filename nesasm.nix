{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  pname = "nesasm";
  version = "3.1.0";

  src = pkgs.fetchFromGitHub {
    owner = "camsaul";
    repo = "nesasm";
    rev = "229033a4b76466b447ad47704808a4d03c493cee";
    sha256 = "1nhmcdj4y6p0xpvnyzqfwiyska7a8j3y8l180rqyicbxawagz8z7";
  };

  buildInputs = [ pkgs.gcc ];

  unpackPhase = ''
    cp -R $src/source/* .
  '';

  buildPhase = ''
    gcc -O4 -Wall -c *.c
    gcc -o nesasm *.o
  '';

  installPhase = ''
    NESASM=$out/bin/nesasm

    mkdir -p $out/bin
    install -D -m555 -T ./nesasm $NESASM
  '' + pkgs.lib.optionalString (!pkgs.stdenv.isDarwin) ''
    chmod u+w $NESASM
    patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" $NESASM
    chmod u-w $NESASM
  '';
}