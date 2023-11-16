{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/release-23.05";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { flake-utils, nixpkgs, self, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      {
        packages.marp-cli = pkgs.callPackage ./marp-cli {};
        packages.default = self.packages.${system}.marp-cli;

        apps.default = {
          type = "app";
          program = "${self.packages.${system}.marp-cli}/bin/marp";
        };
      });
}
