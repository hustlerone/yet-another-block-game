{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {

  name = "Yet Another Block Game";
  src = ./src;

  buildInputs = with pkgs; [
    rustc
    cargo
  ]; # These are runtime deps

  nativeBuildInputs = with pkgs; [

  ]; # Dependencies only available in phases


  buildPhase = ''
    rustc main.rs -o $name
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp $name $out/bin
  '';


}