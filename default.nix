{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {

  name = "Yet Another Block Game";
  src = ./src;

  buildInputs = with pkgs; [
    git
    rustc
    cargo
  ]; # These are runtime deps

  nativeBuildInputs = with pkgs; [

  ]; # Dependencies only available in phases


  buildPhase = ''
    cargo build -r
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp target/release/$name $out/bin
  '';


}