{
  python3Packages,
  fetchFromGitHub,
  python-mini-racer,
  ...
}:
with python3Packages;
buildPythonPackage {
  pname = "akshare";
  version = "1.17.37";
  pyproject = true;

  # src = fetchPypi {
  #   inherit pname version;
  #   sha256 = "sha256-c789EeakvefWOv/3bDlRVeMN3CLt3bYaG+0QQaqlMNY=";
  # };
  src = fetchFromGitHub {
    owner = "akfamily";
    repo = "akshare";
    rev = "0bf588f07d58588a3f0d183ac39fad8ed5a9f083";
    hash = "sha256-IrL/mYi3ohMHxsccD0OuIyyAWT8oRasmn/o92SvpUn8=";
  };

  # Linux 系統實際上也用 mini-racer
  patchPhase = ''
    sed -i \
      -e '/py-mini-racer/d' \
      -e '/akracer/d' \
      -e 's/mini-racer>=.*;platform_system!='"'"'Linux'"'"'/mini-racer>=0.12.4/' \
      setup.py
  '';

  build-system = [ setuptools ];

  dependencies =
    (with python3Packages; [
      aiohttp
      beautifulsoup4
      lxml
      pandas
      requests
      html5lib
      xlrd
      urllib3
      tqdm
      openpyxl
      jsonpath
      tabulate
      decorator
      nest-asyncio
    ])
    ++ [ python-mini-racer ];

  pythonImportsCheck = [ "akshare" ];
}
