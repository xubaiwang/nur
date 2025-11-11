{
  description = "Rust dev shell template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:

    (flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      rec {
        # packages = pkgs.callPackage ./packages { };
        devShells = pkgs.callPackage ./dev-shells { };

        packages.python3Packages.ddddocr =
          let
            ppkgs = pkgs.python3Packages;
          in
          ppkgs.buildPythonPackage rec {
            pname = "ddddocr";
            version = "1.5.6";
            pyproject = true;

            src = pkgs.fetchPypi {
              inherit pname version;
              hash = "sha256-KDmpQL+r4C4yhO8/nSoDcpKqn2QfNVtDqbcL7Onhtz0=";
            };

            build-system = with ppkgs; [ setuptools ];

            dependencies = with ppkgs; [
              onnxruntime
              onnx
              pillow
              numpy
              opencv-python-headless
              fastapi
              uvicorn
              pydantic
            ];
          };
      }
    ))
    // (flake-utils.lib.eachDefaultSystemPassThrough (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        templates = pkgs.callPackage ./templates { };
      }
    ));
}
