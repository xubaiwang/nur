{
  python3Packages,
  fetchPypi,
  ...
}:
with python3Packages;
buildPythonPackage rec {
  pname = "flatlatex";
  version = "0.15";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-UXDhvNT8y1K9vf8wCxS2hzBIO8RvaiqJ964rsCTk0Tk=";
  };

  build-system = [ setuptools ];

  dependencies = [ regex ];

  pythonImportsCheck = [ "flatlatex" ];
}
