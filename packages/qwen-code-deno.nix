{ ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.qwen-code-deno = pkgs.writeShellApplication {
        name = "qwen-code-deno";

        runtimeInputs = with pkgs; [ deno ];

        text = ''
          deno run -A npm:@qwen-code/qwen-code@latest
        '';
      };
    };
}
