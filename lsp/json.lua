---@type vim.lsp.Config
return {
	cmd = { "vscode-json-languageservice", "--stdio" },
	filetypes = { "json", "jsonc" },
}
