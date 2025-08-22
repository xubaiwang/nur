# `@xubaiwang`'s personal Nix User Repository

## Packages

Current supported packages:

| package       | version  | description                            |
| ------------- | -------- | -------------------------------------- |
| `euporie`     | v2.8.11  | Jupyter notebooks in the terminal      |
| `deno-vulkan` | nixpkgs  | Deno with auto vulkan-loader detection |
| `akshare`     | v1.17.37 | Python akshare package                 |

## Usage

Example nix flake usage:

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    xubaiwang = {
      url = "github:xubaiwang/flakes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        euporie = xubaiwang.packages.${system}.python.euporie;
      in
      {
        devShells.default = with pkgs; mkShell {
          packages = [
            euporie
          ];
        };
      }
    );
}
```
