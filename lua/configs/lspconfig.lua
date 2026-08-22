require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

vim.lsp.config("powershell_es", {
  bundle_path = vim.fn.stdpath "data" .. "/mason/packages/powershell-editor-services",
})
vim.lsp.enable "powershell_es"

-- read :h vim.lsp.config for changing options of lsp servers
