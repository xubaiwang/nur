{ ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.netrw-nvim = pkgs.vimUtils.buildVimPlugin {
        pname = "keep-split-ratio-nvim";
        version = "0.0.0";
        src = pkgs.fetchFromGitHub {
          owner = "prichrd";
          repo = "netrw.nvim";
          rev = "90501c62b9b816ed3ed1e912ae9db9af5671a1b2";
          hash = "sha256-tEO+omzlaC0uFkIHebeqnGtiPbDelRTBJONEnTy0F9U=";
        };
      };
    };
}
