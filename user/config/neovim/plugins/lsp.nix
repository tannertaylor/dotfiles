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
      omnisharp.enable = true;
      terraformls.enable = true;
      tsserver.enable = true;
      yamlls.enable = true;
    };
  };
}
