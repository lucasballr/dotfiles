local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "catppuccin/nvim", name = "catppuccin" },
	'nvim-treesitter/nvim-treesitter',
	'neovim/nvim-lspconfig',
	'williamboman/nvim-lsp-installer',
	'preservim/nerdtree',
	"folke/which-key.nvim",

})

require("nvim-lsp-installer").setup {}

local wk = require("which-key")
local opts = {
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
	["<space>"] = {
	e = { "<cmd>NERDTreeToggle<cr>", "Open NERDTree" },
	t = { "<cmd>NERDTreeFocus<cr>", "Focus NERDTree" },
	n = { "<cmd>set invnumber<cr>", "Toggle Line Numbers" },
	w = { "<cmd>WhichKey<cr>", "Toggle Line Numbers" },
	},
}

wk.register(mappings, opts)

vim.cmd.colorscheme "catppuccin-mocha"
