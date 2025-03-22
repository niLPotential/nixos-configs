{ lib, config, ... }: {
  options = {
    helix.enable = lib.mkEnableOption "enables helix editor";
  };
  config = lib.mkIf config.helix.enable {
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
  };
}
