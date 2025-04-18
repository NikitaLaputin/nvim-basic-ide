local helpers = require "user.helpers"
-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }
opts = { silent = false }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>noh<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Better undo
keymap("n", "U", "<C-r>", opts)

-- Copy relative file name
keymap("n", "<leader>cf", "<cmd>let @+= expand('%:.')<cr>")

-- Surround with quotes and parenthesis
keymap("n", "<leader>'", "viw\"zc'<ESC>\"zpa'<ESC>h", opts)
keymap("n", '<leader>"', 'viw"zc"<ESC>"zpa"<ESC>h', opts)
keymap("n", "<leader>(", 'viw"zc(<ESC>"zpa)<ESC>h', opts)
keymap("n", "<leader>)", 'viw"zc(<ESC>"zpa)<ESC>h', opts)
keymap("n", "<leader>{", 'viw"zc{<ESC>"zpa}<ESC>h', opts)
keymap("n", "<leader>}", 'viw"zc{<ESC>"zpa}<ESC>h', opts)
keymap("n", "<leader>[", 'viw"zc[<ESC>"zpa]<ESC>h', opts)
keymap("n", "<leader>]", 'viw"zc[<ESC>"zpa]<ESC>h', opts)
keymap("v", "'", "\"zc'<ESC>\"zpgv<ESC>a'<ESC>gvolol", opts)
keymap("v", '"', '"zc"<ESC>"zpgv<ESC>a"<ESC>gvolol', opts)
keymap("v", "<leader>(", '"zc(<ESC>"zpgv<ESC>a)<ESC>gvolol', opts)
keymap("v", "<leader>)", '"zc(<ESC>"zpgv<ESC>a)<ESC>gvolol', opts)
keymap("v", "<leader>{", '"zc{<ESC>"zpgv<ESC>a}<ESC>gvolol', opts)
keymap("v", "<leader>}", '"zc{<ESC>"zpgv<ESC>a}<ESC>gvolol', opts)
keymap("v", "<leader>[", '"zc[]<ESC>"zP<ESC>gvolol', opts)
keymap("v", "<leader>]", '"zc[<ESC>"zpgv<ESC>a]<ESC>gvolol', opts)

-------------
-- Plugins --
-------------

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<D-p>", ":lua require'telescope.builtin'.find_files({ hidden = true })<CR>", opts)
keymap("n", "<leader>ft", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
keymap("v", "<leader>ft", ":lua require('telescope-live-grep-args.shortcuts').grep_visual_selection()<CR>")
keymap("n", "<leader>fw", ":lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<CR>")
keymap("n", "<leader>fp", ":Telescope pickers<CR>", opts)
keymap("n", "<leader>fl", ":Telescope resume<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fr", ":Telescope lsp_references<CR>", opts)
keymap("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>", opts)
keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
keymap("n", "<leader>gz", "<cmd>:Gitsigns reset_hunk<CR>")
keymap("n", "<leader>gn", "<cmd>:Gitsigns next_hunk<CR>", opts)
keymap("n", "<leader>gp", "<cmd>:Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>ga", "<cmd>:Gitsigns toggle_current_line_blame<CR>")
keymap("n", "<leader>gh", "<cmd>:DiffviewOpen<CR>")
keymap("n", "<leader>gc", "<cmd>:DiffviewClose<CR>")
keymap("n", "<leader>gf", "<cmd>:DiffviewFileHistory %<CR>")
keymap("n", "<leader>gl", "", { callback = helpers.open_line_commit_diff })

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Zen Mode
keymap("n", "<leader>z", "<cmd>lua require('zen-mode').toggle({ window = { backdrop = 1, width = 150 } })<CR>", opts)

-- Config reload
keymap("n", "<leader>cr", "<cmd>lua ReloadConfig()<CR>", { noremap = true, silent = false })

-- LSP
keymap("n", "<leader>jf", "<cmd>lua vim.diagnostic.open_float()<CR>")
keymap("n", "<leader>jd", "<cmd>lua vim.lsp.buf.code_action()<CR>")
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "<leader>fr", ":Telescope lsp_references<CR>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<leader>lf", "<cmd>lua require('conform').format()<cr>", opts)
keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
keymap("n", "<leader>jf", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<leader>jd", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<leader>n", "", { callback = helpers.go_to_next_error })
keymap("n", "<leader>p", "", { callback = helpers.go_to_prev_error })


-- Quickfix
keymap("n", "<leader>cn", "<cmd>cnext<CR>", opts)
keymap("n", "<leader>cp", "<cmd>cprev<CR>", opts)
keymap("n", "<leader>co", "<cmd>copen<CR>", opts)
keymap("n", "<leader>cc", "<cmd>cclose<CR>", opts)
