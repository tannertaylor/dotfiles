{ ... }: {
  home.file.".omnisharp/omnisharp.json".text = ''
    {
      "RoslynExtensionsOptions": {
        "enableAnalyzersSupport": true
      },
      "FormattingOptions": {
        "enableEditorConfigSupport": true
      }
    }
  '';
}
