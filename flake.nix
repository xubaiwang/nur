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
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      rec {
        packages.euporie =
          with pkgs;
          python3Packages.buildPythonPackage rec {
            pname = "euporie";
            version = "2.8.11";
            pyproject = true;

            src = fetchPypi {
              inherit pname version;
              sha256 = "sha256-+v1egzfnWgI2EpNmKpgtZhvTQbT24aR2++WeuAoUrm0=";
            };

            build-system = with python3Packages; [ hatchling ];

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
                  fsspec
                  jupytext
                ]
                ++ fsspec.optional-dependencies.http
              )
              ++
                # custom dependencies
                (with packages; [
                  timg
                  sixelcrop
                  flatlatex
                ]);
          };

        packages.timg =
          with pkgs;
          python3Packages.buildPythonPackage rec {
            pname = "timg";
            version = "1.1.6";
            pyproject = true;

            src = fetchPypi {
              inherit pname version;
              sha256 = "sha256-k42TmsNQIwD3ueParfXaD4jFuG/eWILXO0Op0Ci9S/0=";
            };

            build-system = with python3Packages; [ setuptools ];

            dependencies = with python3Packages; [ pillow ];

            pythonImportsCheck = [ "timg" ];
          };

        packages.sixelcrop =
          with pkgs;
          python3Packages.buildPythonPackage rec {
            pname = "sixelcrop";
            version = "0.1.9";
            pyproject = true;

            src = fetchPypi {
              inherit pname version;
              sha256 = "sha256-1sBaxPvW4gH3lK3tEjAPtCdXMXLAVEof0lpIpmpbyG8=";
            };

            build-system = with python3Packages; [ hatchling ];

            pythonImportsCheck = [ "sixelcrop" ];
          };

        packages.flatlatex =
          with pkgs;
          python3Packages.buildPythonPackage rec {
            pname = "flatlatex";
            version = "0.15";
            pyproject = true;

            src = fetchPypi {
              inherit pname version;
              sha256 = "sha256-UXDhvNT8y1K9vf8wCxS2hzBIO8RvaiqJ964rsCTk0Tk=";
            };

            build-system = with python3Packages; [ setuptools ];

            dependencies = with python3Packages; [ regex ];

            pythonImportsCheck = [ "flatlatex" ];
          };
      }
    );
}
