{
  python3Packages,
  fetchPypi,
  ...
}:
with python3Packages;
buildPythonPackage rec {
  pname = "sixelcrop";
  version = "0.1.9";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-1sBaxPvW4gH3lK3tEjAPtCdXMXLAVEof0lpIpmpbyG8=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "sixelcrop" ];
}
