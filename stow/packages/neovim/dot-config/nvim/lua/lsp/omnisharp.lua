return {
  server_name = "omnisharp",
  opts = {
    cmd = { "/usr/bin/omnisharp" },
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
