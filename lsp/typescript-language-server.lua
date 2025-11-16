---@type vim.lsp.Config
return {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
    -- resolve starting from the current directory
    root_dir = vim.fs.root(vim.env.PWD, { "tsconfig.json", "jsconfig.json", "package.json", ".git" }),

	settings = {
		typescript = {
			preferences = {
				includeCompletionsForModuleExports = true,
				includeCompletionsForImportStatements = true,
				importModuleSpecifier = "relative",
			},
		},
	},
}
