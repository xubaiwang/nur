{
  python3Packages,
  fetchPypi,
  timg,
  sixelcrop,
  flatlatex,
  ...
}:
with python3Packages;
buildPythonPackage rec {
  pname = "euporie";
  version = "2.8.11";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-+v1egzfnWgI2EpNmKpgtZhvTQbT24aR2++WeuAoUrm0=";
  };

  build-system = [ hatchling ];

  # patch platform dirs to use newer version
  patchPhase = ''
    sed -i 's#platformdirs~=3\.5#platformdirs~=4.3.8#g' pyproject.toml
  '';

  dependencies =
    # already on nixpkgs
    (
      with python3Packages;
      [
        prompt-toolkit
        pygments
        nbformat
        jupyter-client
        typing-extensions
        fastjsonschema
        pyperclip
        imagesize
        markdown-it-py
        linkify-it-py
        mdit-py-plugins
        pillow
        universal-pathlib
        jupytext
        fsspec
      ]
      # fsspec[http]
      ++ fsspec.optional-dependencies.http
    )
    ++
      # custom dependencies
      ([
        timg
        sixelcrop
        flatlatex
      ]);
}
