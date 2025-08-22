{
  python3Packages,
  fetchPypi,
  ...
}:
with python3Packages;
buildPythonPackage rec {
  pname = "timg";
  version = "1.1.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-k42TmsNQIwD3ueParfXaD4jFuG/eWILXO0Op0Ci9S/0=";
  };

  build-system = [ setuptools ];

  dependencies = [ pillow ];

  pythonImportsCheck = [ "timg" ];
}
