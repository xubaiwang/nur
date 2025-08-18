{
  callPackage,
  ...
}:
rec {
  euporie = callPackage ./euporie.nix { inherit timg sixelcrop flatlatex; };
  timg = callPackage ./timg.nix { };
  deno-vulkan = callPackage ./deno-vulkan.nix { };
  sixelcrop = callPackage ./sixelcrop.nix { };
  flatlatex = callPackage ./flatlatex.nix { };
  python-akshare = callPackage ./python-akshare.nix { inherit python-mini-racer; };
  python-mini-racer = callPackage ./python-mini-racer.nix { };
}
