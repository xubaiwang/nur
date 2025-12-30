{ ... }:
{
  flake = {
    templates.rust = {
      description = "Rust dev shell template";
      path = ./rust;
    };
  };
}
