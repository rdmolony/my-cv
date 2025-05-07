{
  inputs = {
    utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, utils }: utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      texEnv = pkgs.texliveSmall.withPackages (ps: with ps; [
        latexmk
        enumitem
        supertabular
        titlesec
        multirow
        fontawesome5
      ]);
    in
    {
      devShell = pkgs.mkShell {
        buildInputs = with pkgs; [
          texEnv
          git-lfs
        ];
      };
      apps = {
        latexmk = {
          type = "app";
          program = "${texEnv}/bin/latexmk";
        };
      };
    }
  );
}
