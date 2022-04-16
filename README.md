# NESASM Nix
Nix derivations for building nesasm and putting them to use.

[![test](https://github.com/katsujukou/nesasm.nix/workflows/test/badge.svg)](https://github.com/katsujukou/nesasm.nix/actions/workflows/ci.yml)

## Usage
By `shell.nix`:
```nix
{ pkgs ? import <nixpkgs> {} }:
let
  nesasmSrc = pkgs.fetchFromGitHub {
    owner = "katsujukou";
    repo = "nesasm.nix";
    rev = "79466a5257ab263f4001dbe1b51383816f0c3bf9";
    sha256 = "11x7ywj1jr380z2759bc4m7imk679k4z10xdv34lrqhsgx35s3n2";
  };
  inherit (import nesasmSrc {}) nesasm;
in
  pkgs.mkShell {
    buildInputs = [ nesasm ];
  }
```
