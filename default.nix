{ pkgs ? import <nixpkgs> {} }:

let
  inputs = {
    nesasm = import ./nesasm.nix {
      inherit pkgs;
    };
  };

  buildInputs = builtins.attrValues inputs;

in 
  inputs // {
    inputs = inputs;
    buildInputs = buildInputs;
    shell = pkgs.runCommand "nesasm-nix-shell"
      {
        buildInputs = buildInputs;
      } "";
  }