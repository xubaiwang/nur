{
  deno,
  patchelf,
  stdenvNoCC,
  vulkan-loader,
  ...
}:
stdenvNoCC.mkDerivation {
  pname = "deno-vulkan";
  version = deno.version;

  src = deno;
  buildInputs = [ vulkan-loader ];
  nativeBuildInputs = [ patchelf ];

  phases = [ "installPhase" ];
  installPhase = ''
    install -D $src/bin/deno $out/bin/deno
    patchelf --add-rpath ${vulkan-loader}/lib $out/bin/deno
  '';
}
