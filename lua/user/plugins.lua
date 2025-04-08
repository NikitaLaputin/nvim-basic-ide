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
	use { "echasnovski/mini.nvim" } -- Autopairs
	use({ "numToStr/Comment.nvim" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
    use({ "echasnovski/mini.icons" }) -- Icon provider
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "moll/vim-bbye" }) -- Close buffer
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/toggleterm.nvim" })
	use({ "ahmedkhalf/project.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({ "goolord/alpha-nvim" })
	use({ "sindrets/diffview.nvim" }) -- Diff viewer
	use({ "gpanders/editorconfig.nvim" })
	use({ "folke/zen-mode.nvim" })
	use({ "iamcco/markdown-preview.nvim" })

	-- Colorschemes
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- LSP
	use({ "williamboman/mason.nvim" })
	use({ "stevearc/conform.nvim" }) -- for formatters
	use({ "RRethy/vim-illuminate" })
	use({ "yioneko/nvim-vtsls" })

    -- Completion
    use({ "echasnovski/mini.nvim" })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
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
