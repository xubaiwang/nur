{ ... }:
{
  perSystem =
    { pkgs, lib, ... }:
    {
      devShells.bevy = pkgs.mkShell {
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
      };
    };
}
