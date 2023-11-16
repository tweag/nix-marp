{ stdenv, system, ... }:

let
  data = builtins.fromJSON (builtins.readFile ./data/${system}.json);
in

stdenv.mkDerivation rec {
  name = "marp-cli";
  version = "3.4.0";

  src = builtins.fetchurl {
    url = data.url;
    sha256 = data.hash;
  };

  phases = [ "unpackPhase" "installPhase" ];

  unpackPhase = ''
    tar -xzf $src
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp marp $out/bin/
  '';
}
