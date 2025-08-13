{
  callPackage,
  ...
}:
rec {
  euporie = callPackage ./euporie.nix { inherit timg sixelcrop flatlatex; };
  timg = callPackage ./timg.nix { };
  sixelcrop = callPackage ./sixelcrop.nix { };
  flatlatex = callPackage ./flatlatex.nix { };
}
