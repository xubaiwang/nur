{ ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.ddddocr =
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
    };
}
