vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'nvim-lua/plenary.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- Background Transparent
    use 'xiyaowong/nvim-transparent'

    -- Syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua'
        }
    }

    -- File finder
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Javascript
    use 'pangloss/vim-javascript'
    use 'maxmellon/vim-jsx-pretty'
    use 'peitalin/vim-jsx-typescript'

    -- Colorschemes
    use 'folke/tokyonight.nvim'
    use 'morhetz/gruvbox'
    use 'overcache/NeoSolarized'

    -- Autosave
    use 'Pocco81/auto-save.nvim'
    end)
