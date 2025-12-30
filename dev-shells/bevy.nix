{ ... }:
{
  perSystem =
    { pkgs, lib, ... }:
    {
      devShells.bevy = pkgs.mkShell rec {
        packages = with pkgs; [
          rust-analyzer
          rustfmt
          clippy
        ];

        buildInputs = with pkgs; [
          vulkan-loader
          wayland
          alsa-lib
          udev
          libxkbcommon
        ];

        nativeBuildInputs = with pkgs; [
          pkg-config
          cargo
          rustc
        ];

        LD_LIBRARY_PATH = "${lib.makeLibraryPath buildInputs}";

        NIX_NO_SELF_RPATH = true;
      };
    };
}
