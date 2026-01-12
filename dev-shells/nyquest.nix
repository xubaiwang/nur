{ ... }:
{
  perSystem =
    { pkgs, lib, ... }:
    {
      devShells.nyquest = pkgs.mkShell {
        packages = with pkgs; [
          rust-analyzer
          rustfmt
          clippy
        ];

        nativeBuildInputs = with pkgs; [
          cargo
          rustc
          pkg-config
        ];

        buildInputs = with pkgs; [
          curl
          openssl
        ];

        NIX_NO_SELF_RPATH = true;
        RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
      };
    };
}
