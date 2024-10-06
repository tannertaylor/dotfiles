return {
  {
    "nvim-treesitter/nvim-treesitter",

    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cmake",
        "css",
        "c_sharp",
        "diff",
        "dockerfile",
        "editorconfig",
        "git_config",
        "go",
        "graphql",
        "hcl",
        "html",
        "http",
        "java",
        "javascript",
        "jq",
        "json",
        "kotlin",
        "lua",
        "luadoc",
        "make",
        "nginx",
        "regex",
        "rust",
        "ssh_config",
        "toml",
        "typescript",
        "xml",
        "yaml",
      },

      auto_install = true,

      highlight = { enable = true },
      indentation = { enable = true },
    },
  }
}
