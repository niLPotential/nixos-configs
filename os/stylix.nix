{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    stylixModule.enable = lib.mkEnableOption "enables stylix module";
  };
  config = lib.mkIf config.stylixModule.enable {
    stylix = {
      enable = true;
      image = pkgs.fetchurl {
        url = "https://gamecms-res.sl916.com/official_website_resource/50001/4/PICTURE/20241126/385%201440x2560_f3332807554c4d938c544b5294dff0bd.jpg";
        hash = "sha256-C/HSCdatpt7zeXe+KRg+mSAOMtOAgK0R92sG3Y/ZGPM=";
        # url = "https://storage.matsurihi.me/mltd/card_bg/049mom0584_1.png";
        # hash = "sha256-iFtWhrrmgQJ+FYVX14Rt2+Kgj3ajhMJ7u8pP6cF/S2c=";
        # url = "https://storage.matsurihi.me/mltd/card_bg/049mom0384_1.png";
        # hash = "sha256-T0rrI2DsYsrPlN2s0LMhDZP+RQQ8Rp7PgcSkEGv2YJ4=";
      };
      fonts = {
        monospace = {
          name = "D2Coding ligature";
          package = pkgs.d2coding;
        };
        sansSerif = {
          name = "NanumBarunGothic";
          package = pkgs.nanum;
        };
        serif = {
          name = "NanumMyeongjo";
          package = pkgs.nanum;
        };
        sizes = {
          applications = 14;
          desktop = 12;
          popups = 12;
          terminal = 14;
        };
      };
    };
  };
}
