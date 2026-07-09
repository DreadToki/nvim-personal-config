local function get_prettier_xml_plugin_path()
  -- A list of paths to check, in order of priority
  local paths = {
    vim.fn.expand("~/.npm-global/lib/node_modules/@prettier/plugin-xml/src/plugin.js"),
    "/opt/homebrew/lib/node_modules/@prettier/plugin-xml/src/plugin.js",
    "/usr/local/lib/node_modules/@prettier/plugin-xml/src/plugin.js",
  }

  for _, path in ipairs(paths) do
    if vim.fn.filereadable(path) == 1 then
      return path
    end
  end

  return "@prettier/plugin-xml"
end

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
          "--plugin",
          get_prettier_xml_plugin_path(),
          "--print-width",
          "120",
        },
      },
    },
  },
}
