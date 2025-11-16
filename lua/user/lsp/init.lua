-- Load LSPs installed by Mason
require ("user.lsp.mason")
-- Load diagnostics config
require ("user.lsp.diagnostics").setup()
-- Load formatter
require("user.lsp.conform")

vim.lsp.enable({
    "css",
    "html-lsp",
    "lua-ls",
    "json",
    "typescript-language-server"
})
