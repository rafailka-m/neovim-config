local map=vim.keymap.set
local opts={ noremap=true, silent=true }
local normal_mode='n'

vim.diagnostic.config({signs=false})

map('n', '<leader>e', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', '<leader>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    map(normal_mode, 'gD', vim.lsp.buf.declaration, bufopts)
    map(normal_mode, 'gd', vim.lsp.buf.definition, bufopts)
    map(normal_mode, 'K', vim.lsp.buf.hover, bufopts)
    map(normal_mode, 'gi', vim.lsp.buf.implementation, bufopts)
    map(normal_mode, '<C-k>', vim.lsp.buf.signature_help, bufopts)
    map(normal_mode, '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    map(normal_mode, '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    map(normal_mode, '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
    map(normal_mode, '<leader>D', vim.lsp.buf.type_definition, bufopts)
    map(normal_mode, '<leader>rn', vim.lsp.buf.rename, bufopts)
    map(normal_mode, '<leader>ca', vim.lsp.buf.code_action, bufopts)
    map(normal_mode, 'gr', vim.lsp.buf.references, bufopts)
    map(normal_mode, '<leader>f', vim.lsp.buf.formatting, bufopts)
end

local nvim_lsp=require('lspconfig')

local servers = { 'pyright', }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach=on_attach,
        flags={
            debounce_text_changes=150
        }
    }
end

-- JS / TS
nvim_lsp.tsserver.setup {
    on_attach=on_attach,
    filetypes={ 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'javascript.jsx', 'typescript.tsx' },
}
