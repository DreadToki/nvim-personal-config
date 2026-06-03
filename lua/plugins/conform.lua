return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      cs = { "csharpier" },
      xml = { "prettier" },
      axaml = { "prettier" },
    },

    formatters = {
      prettier = {
        prepend_args = {
          "--parser",
          "xml",
          -- Pointing directly to the plugin.js file as demanded by Node's ESM resolution
          "--plugin",
          vim.fn.expand("~/.npm-global/lib/node_modules/@prettier/plugin-xml/src/plugin.js"),
          "--print-width",
          "120",
        },
      },
    },
  },
}
