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
}
