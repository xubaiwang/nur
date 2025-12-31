{ ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.keep-split-ratio-nvim = pkgs.vimUtils.buildVimPlugin {
        pname = "keep-split-ratio-nvim";
        version = "0.0.0";
        src = pkgs.fetchFromGitHub {
          owner = "adlrwbr";
          repo = "keep-split-ratio.nvim";
          rev = "906aa5196e194dca12c7729069760d42e77ddcff";
          hash = "sha256-zrCiYlGOMmAM91VY6g2iWPmgnggfo3YvVOqkjm2l35Q=";
        };
      };
    };
}
