{
  lib,
  bashInteractive,
  mkShell,
  openssl,
  rustc,
  cargo,
  clippy,
  rustfmt,
  rust-analyzer,
  pkg-config,
  ...
}:
mkShell rec {
  buildInputs = [ openssl ];
  nativeBuildInputs = [
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

  shellHook = ''
    export SHELL=${bashInteractive}/bin/bash
  '';
}
