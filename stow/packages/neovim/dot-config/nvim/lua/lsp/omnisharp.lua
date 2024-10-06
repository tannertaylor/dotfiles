return {
  server_name = "omnisharp",
  opts = {
    cmd = "omnisharp",
    settings = {
      FormattingOptions = {
        EnableEditorConfigSupport = true,
        OrganizeImports = true,
      },

      RoslynExtensionOptions = {
        EnableAnalyzersSupport = true,
        EnableImportCompletion = true,
      },
    },
  },
}
