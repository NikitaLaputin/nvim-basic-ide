local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
	git = {
		clone_timeout = 300, -- Timeout, in seconds, for git clones
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	-- use { "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" } -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })
    -- Close buffer
	use({ "moll/vim-bbye" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/toggleterm.nvim" })
	-- use({ "ahmedkhalf/project.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({ "goolord/alpha-nvim" })
	use({ "sindrets/diffview.nvim" }) -- Diff viewer
	use({ "gpanders/editorconfig.nvim" })
	use({ "folke/zen-mode.nvim" })
	use({ "iamcco/markdown-preview.nvim" })

	-- Colorschemes
	-- use({ "projekt0n/github-nvim-theme" })
	-- use({ "sainnhe/edge" })
	-- use({ "navarasu/onedark.nvim" })
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	-- snippets
	-- use({ "L3MON4D3/LuaSnip" }) --snippet engine
	-- use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "stevearc/conform.nvim" }) -- for formatters
	use({ "RRethy/vim-illuminate" })
	use({ "yioneko/nvim-vtsls" })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
		config = function()
			require("telescope").load_extension("live_grep_args")
			require("telescope").load_extension("fzf")
		end,
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
	})
	use({ "nvim-treesitter/playground" })
	use({ "nvim-treesitter/nvim-treesitter-context" })

	-- Git
	use({ "lewis6991/gitsigns.nvim" })

	-- DAP
	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui" })
	use({ "jay-babu/mason-nvim-dap.nvim" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
