{ ... }: {
  lsp = {
    enable = true;

    servers = {
      bashls.enable = true;
      cssls.enable = true;
      dockerls.enable = true;
      docker-compose-language-service.enable = true;
      html.enable = true;
      jsonls.enable = true;
      nil-ls.enable = true;
      omnisharp = {
        enable = true;
        extraOptions = {
          handlers = {
            "textDocument/definition" = { __raw = "require('omnisharp_extended').definition_handler"; };
            "textDocument/typeDefinition" = { __raw = "require('omnisharp_extended').type_definition_handler"; };
            "textDocument/references" = { __raw = "require('omnisharp_extended').references_handler"; };
            "textDocument/implementation" = { __raw = "require('omnisharp_extended').implementation_handler"; };
          };
        };
      };
      rust-analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
      };
      terraformls.enable = true;
      tsserver.enable = true;
      yamlls.enable = true;
    };
  };
}
