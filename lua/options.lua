vim.opt.wrap = false
vim.opt.number = true

vim.opt.mouse='a'
vim.opt.encoding='utf-8'
vim.opt.swapfile=false
vim.opt.scrolloff=7

vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.autoindent=true
vim.opt.fileformat='unix'

vim.opt.smartindent=true
vim.opt.tabstop=2
vim.opt.expandtab=true
vim.opt.shiftwidth=4

vim.g.mapleader=','

inoremap = vim.keymap.set
insert_mode = 'i'
inoremap(insert_mode, 'jk', '<ESC>')

-- Enable colorscheme
vim.cmd.colorscheme('gruvbox')

-- Treesitter configuration
require('nvim-treesitter.configs').setup {
    ensure_installed=all,
    highlight={ enable=true }
}

-- Telescope configuration
require('telescope').setup {
    pickers = {
        buffers = {
            initial_mode='normal'
        }
    },
}
local map=vim.api.nvim_set_keymap
local opts={ noremap=true, silent=true }
local normal_mode='n'

map(normal_mode, '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
map(normal_mode, '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)

-- Previous / next / closing tab mapping
local map=vim.keymap.set
map(normal_mode, 'tn', '<cmd>bn<CR>')
map(normal_mode, 'tp', '<cmd>bp<CR>')
map(normal_mode, 'tc', '<cmd>bd<CR>')

-- autocmd
vim.cmd("autocmd FileType python map <buffer> <C-h> :w<CR>:exec '!python3.11' shellescape(@%, 1)<CR>")
vim.cmd("autocmd FileType python set colorcolumn=79")

-- background transparent
vim.g.transparent_enabled = true
