{ pkgs ? import <nixpkgs> {} }:

let
  default = import ./default.nix {};

  buildInputs = builtins.attrValues {
    inherit (pkgs) which;
    inherit (default) nesasm;
  };
in
  pkgs.mkShell {
    buildInputs = buildInputs;
  }