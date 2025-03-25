{ lib, config, ... }: {
  options = {
    firefox.enable = lib.mkEnableOption "enable firefox";
  };
  config = lib.mkIf config.firefox.enable {
    programs.firefox = {
      enable = true;
      profiles.kiria = {
        name = "kiria";
        isDefault = true;
        search = {
          default = "ddg";
          force = true;
        };
        settings = {
          "browser.privatebrowsing.autostart" = true;
        };
        extensions.force = true;
        bookmarks = {
          force = true;
          settings = [
            {
              toolbar = true;
              bookmarks = [
                {
                  name = "Nix";
                  bookmarks = [
                    {
                      name = "Nix & NixOS";
                      url = "https://nixos.org/";
                    }
                    {
                      name = "Home Manager Options";
                      url = "https://nix-community.github.io/home-manager/options.xhtml";
                    }
                    {
                      name = "Stylix";
                      url = "https://stylix.danth.me/";
                    }
                    {
                      name = "river";
                      url = "https://codeberg.org/river/wiki/";
                    }
                    {
                      name = "AcrhWiki";
                      url = "https://wiki.archlinux.org/";
                    }
                  ];
                }
                {
                  name = "Dev";
                  bookmarks = [
                    {
                      name = "Helix";
                      url = "https://helix-editor.com/";
                    }
                    {
                      name = "Zed";
                      url = "https://zed.dev/";
                    }
                    {
                      name = "Deno";
                      url = "https://deno.com";
                    }
                    {
                      name = "Go Standard Library";
                      url = "https://pkg.go.dev/std";
                    }
                    {
                      name = "BOJ";
                      url = "https://www.acmicpc.net/";
                    }
                    {
                      name = "solved.ac";
                      url = "https://solved.ac";
                    }
                  ];
                }
                {
                  name = "Front-End";
                  bookmarks = [
                    {
                      name = "MDN Web Docs";
                      url = "https://developer.mozilla.org/";
                    }
                    {
                      name = "React";
                      url = "https://react.dev";
                    }
                    {
                      name = "React Router";
                      url = "https://reactrouter.com/home";
                    }
                    {
                      name = "Astro";
                      url = "https://astro.build/";
                    }
                    {
                      name = "Tailwind CSS";
                      url = "https://tailwindcss.com/";
                    }
                    {
                      name = "UnoCSS";
                      url = "https://unocss.dev/";
                    }
                    {
                      name = "StyleX";
                      url = "https://stylexjs.com/";
                    }
                  ];
                }
              ];
            }
          ];
        };
      };
    };
    stylix.targets.firefox = {
      colorTheme.enable = true;
      profileNames = [ "kiria" ];
    };
  };
}
