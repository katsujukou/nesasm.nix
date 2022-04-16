{ pkgs ? import <nixpkgs> {} }:

let
  nesasm = import ./nesasm.nix {
    inherit pkgs;
  };
in rec {
  buildInputs = [ nesasm ];
  shell = pkgs.runCommand "nesasm-nix-shell"
    {
      buildInputs = buildInputs;
    } "";
}