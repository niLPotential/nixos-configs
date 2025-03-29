{ lib, config, ... }:
{
  options = {
    zed-editor.enable = lib.mkEnableOption "enables zed-editor";
  };
  config = lib.mkIf config.zed-editor.enable {
    programs.zed-editor = {
      enable = true;
      extensions = [
        "astro"
        "deno"
      ];
    };
  };
}
