{ ... }:
{
  flake = {
    templates.bevy = {
      description = "Bevy dev shell template";
      path = ./bevy;
    };
  };
}
