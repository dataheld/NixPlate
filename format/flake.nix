{
  description = "treefmt-nix";
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/*";
    # keep-sorted start
    treefmt-nix.url = "github:numtide/treefmt-nix";
    flake-utils.url = "https://flakehub.com/f/numtide/flake-utils/0.1.102.tar.gz";
    # keep-sorted end
  };

  outputs = {
    nixpkgs,
    flake-utils,
    treefmt-nix,
    self
  }: 
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in rec {
        treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
        formatter = treefmtEval.config.build.wrapper;
        formatting = treefmtEval.config.build.check self;
      }
    );
}
