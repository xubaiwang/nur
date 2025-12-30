{ python3Packages, fetchPypi, ... }:

python3Packages.buildPythonPackage rec {
  pname = "ddddocr";
  version = "1.5.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-KDmpQL+r4C4yhO8/nSoDcpKqn2QfNVtDqbcL7Onhtz0=";
  };

  build-system = with python3Packages; [ setuptools ];

  dependencies = with python3Packages; [
    onnxruntime
    onnx
    pillow
    numpy
    opencv-python-headless
    fastapi
    uvicorn
    pydantic
  ];
}
