{ pkgs ? import <nixpkgs> {} }:

with pkgs;

stdenv.mkDerivation rec {
  name = "package-updater";
  buildCommand = ''
    ${pkgs.bash}/bin/bash -c "${pkgs.nix}/bin/nix-channel --update && ${pkgs.nix}/bin/nix-env -u '*'"
  '';
  buildInputs = [ pkgs.bash pkgs.nix ];
}
