{
  home.username = "kiria";
  home.homeDirectory = "/home/kiria";

  stylix.enable = true;

  gtk.enable = true;

  programs.firefox.enable = true;
  # programs.gh.enable = true;
  programs.git = {
    enable = true;
    userName = "niLPotential";
    userEmail = "niLPotential@proton.me";
  };
  programs.gnome-shell.enable = true;
  programs.go.enable = true;
  programs.helix = {
    enable = true;
    defaultEditor = true;
    languages = {
      language = [
        {
          name = "javascript";
          shebangs = [ "deno" ];
          roots = [ "deno.json" "deno.jsonc" ];
          file-types = [ "js" ];
          language-servers = [ "deno-lsp" ];
          auto-format = true;
        }
        {
          name = "typescript";
          shebangs = [ "deno" ];
          roots = [ "deno.json" "deno.jsonc" ];
          file-types = [ "ts" ];
          language-servers = [ "deno-lsp" ];
          auto-format = true;
        }
        {
          name = "jsx";
          shebangs = [ "deno" ];
          roots = [ "deno.json" "deno.jsonc" ];
          file-types = [ "jsx" ];
          language-servers = [ "deno-lsp" ];
          auto-format = true;
        }
        {
          name = "tsx";
          shebangs = [ "deno" ];
          roots = [ "deno.json" "deno.jsonc" ];
          file-types = [ "tsx" ];
          language-servers = [ "deno-lsp" ];
          auto-format = true;
        }
        {
          name = "json";
          formatter = { command = "deno"; args = [ "fmt" "-" "--ext" "json" ]; };
          auto-format = true;
        }
        {
          name = "html";
          formatter = { command = "deno"; args = [ "fmt" "-" "--ext" "html" ]; };
          auto-format = true;
        }
        {
          name = "go";
          auto-format = true;
          formatter = { command = "goimports"; };
        }
      ];
      language-server.deno-lsp = {
        command = "deno";
        args = [ "lsp" ];
        environment = { NO_COLOR = "1"; };
        config.deno = {
          enable = true;
        };
      };
    };
  };
  programs.ssh.enable = true;
  programs.starship.enable = true;
  programs.zed-editor.enable = true;
  programs.zsh.enable = true;


  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
