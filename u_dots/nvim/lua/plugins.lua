local plugins = { 
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, config = function() require("plugins/catppuccin") end },
    { 'nvimdev/dashboard-nvim', config = function() require('plugins/dashboard') end, },
    { "nvim-tree/nvim-tree.lua", dependencies = {"nvim-tree/nvim-web-devicons",}, config = function() require("plugins/nvim-tree") end,},
    --{ "akinsho/nvim-bufferline.lua", config = function() require("plugins/bufferline") end },
    { 'romgrk/barbar.nvim',dependencies = { 'lewis6991/gitsigns.nvim', 'nvim-tree/nvim-web-devicons', }, },
    {"rafamadriz/friendly-snippets"}, {"Neevash/awesome-flutter-snippets"}, {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets",
            "L3MON4D3/LuaSnip", "hrsh7th/cmp-nvim-lua", "hrsh7th/cmp-path",
            "hrsh7th/cmp-calc"
        },
        config = function() require("plugins/cmp") end
    },
    {"onsails/lspkind-nvim"},
    {
        "terrortylor/nvim-comment",
        cmd = "CommentToggle",
        config = function() require("nvim_comment").setup() end
    },
    { 'Exafunction/codeium.vim', },
}

require("lazy").setup(plugins, opts)
