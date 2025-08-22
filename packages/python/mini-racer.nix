{
  python3Packages,
  fetchPypi,
  ...
}:
with python3Packages;
buildPythonPackage rec {
  pname = "mini_racer";
  version = "0.12.4";

  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "sha256-aaHETQKpBpuIFoTO8VotdH/gdD3ynq3Igf2nACquX9I=";
    dist = "py3";
    python = "py3";
    platform = "manylinux_2_31_x86_64";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "py_mini_racer" ];
}
