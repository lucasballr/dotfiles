-- This is for setting vars in vim
vim.opt.shiftwidth = 4

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
	'nvim-lua/plenary.nvim',
	'nvim-telescope/telescope.nvim',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-vsnip',
	'hrsh7th/vim-vsnip',
	'terrortylor/nvim-comment',
	"lukas-reineke/indent-blankline.nvim",
})

require("nvim-lsp-installer").setup {}

require('nvim_comment').setup({create_mappings = false})

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
	t = { "<cmd>Telescope find_files<cr>", "Open Telescope" },
	e = { "<cmd>NERDTreeToggle<cr>", "Open NERDTree" },
	r = { "<cmd>NERDTreeFocus<cr>", "Focus NERDTree" },
	n = { "<cmd>set invnumber<cr>", "Toggle Line Numbers" },
	k = { "<cmd>WhichKey<cr>", "Toggle Line Numbers" },
	l = { "<cmd>LspInstallInfo<cr>", "Open LSP Installer" },
	['/'] = { "<cmd>CommentToggle<cr>", "Comment line/selection" },
	d = { "<cmd>vs<cr>", "Split Screen Vertically" },
	w = { "<cmd>clo<cr>", "Close Buffer" },
	q = { "<cmd>q<cr>", "Quit" },
	s = { "<cmd>w<cr>", "Write File" },
	},
}

wk.register(mappings, opts)

vim.cmd.colorscheme "catppuccin-mocha"

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

local cmp = require'cmp'
cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- require('lspconfig')['pylsp'].setup {
    -- capabilities = capabilities
-- }
require('lspconfig')['rust_analyzer'].setup {
    capabilities = capabilities
}
