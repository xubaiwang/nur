{
  description = "Rust dev shell template";

  outputs =
    { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        # packages
        ./packages/ddddocr.nix
        ./packages/keep-split-ratio-nvim.nix
        ./packages/netrw-nvim.nix

        # dev shells
        ./dev-shells/boa.nix
        ./dev-shells/rust.nix
        ./dev-shells/bevy.nix
      ];

      flake = {

        templates.rust = {
          description = "Rust dev shell template";
          path = ./templates/rust;
        };
        templates.bevy = {
          description = "Bevy dev shell template";
          path = ./templates/bevy;
        };
      };

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
}
