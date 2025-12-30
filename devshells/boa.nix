{ ... }:
{
  perSystem =
    { pkgs, lib, ... }:
    {
      devShells.boa = pkgs.mkShell rec {
        buildInputs = with pkgs; [ openssl ];
        nativeBuildInputs = with pkgs; [
          rustc
          cargo
          clippy
          rustfmt
          rust-analyzer
          pkg-config
        ];

        LD_LIBRARY_PATH = "${lib.makeLibraryPath buildInputs}";
        # Required for jemalloc, see https://github.com/NixOS/nixpkgs/issues/370494 .
        CFLAGS = "-DJEMALLOC_STRERROR_R_RETURNS_CHAR_WITH_GNU_SOURCE";
      };
    };
}
