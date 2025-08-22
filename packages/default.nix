{
  callPackage,
  ...
}:
{
  deno-vulkan = callPackage ./deno-vulkan.nix { };

  python = rec {
    timg = callPackage ./python/timg.nix { };
    euporie = callPackage ./python/euporie.nix { inherit timg sixelcrop flatlatex; };
    sixelcrop = callPackage ./python/sixelcrop.nix { };
    flatlatex = callPackage ./python/flatlatex.nix { };
    akshare = callPackage ./python/akshare { inherit mini-racer; };
    mini-racer = callPackage ./python/mini-racer.nix { };
  };
}
