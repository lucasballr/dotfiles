local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>y', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<leader>u', ':NvimTreeFocus<CR>', opts)
vim.keymap.set('n', '<leader>h', '<C-w>h', opts)
vim.keymap.set('n', '<leader>j', '<C-w>j', opts)
vim.keymap.set('n', '<leader>k', '<C-w>k', opts)
vim.keymap.set('n', '<leader>l', '<C-w>l', opts)

vim.keymap.set('n', '<leader>x', ':BufferClose<CR>', opts)
vim.keymap.set('n', '<leader>a', ':BufferPrevious<CR>', opts)
vim.keymap.set('n', '<leader>d', ':BufferNext<CR>', opts)

vim.keymap.set('n', '<leader>/', ':CommentToggle<CR>', opts)
vim.keymap.set('v', '<leader>/', ':CommentToggle<CR>', opts)

vim.keymap.set('n', '<leader>q', ':q<CR>', opts)
