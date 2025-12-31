{ ... }:
{
  perSystem =
    { pkgs, lib, ... }:
    {
      devShells.rust = pkgs.mkShell {
        packages = with pkgs; [
          rust-analyzer
          rustfmt
          clippy
        ];

        nativeBuildInputs = with pkgs; [
          cargo
          rustc
        ];

        NIX_NO_SELF_RPATH = true;
        RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
      };
    };
}
