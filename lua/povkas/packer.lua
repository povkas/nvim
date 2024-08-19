-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    })

    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    javascript = { "prettierd", "prettier", "eslint_d", lsp_format = "fallback" },
                    typescript = { "prettierd", "prettier", "eslint_d", lsp_format = "fallback" },
                },
            })
        end,
    })

    use({
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end,
    })

    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" }
        }
    }

    use('christoomey/vim-tmux-navigator')

    use('folke/tokyonight.nvim')

    use('nvim-treesitter/nvim-treesitter-context')

    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use('smartpde/telescope-recent-files')

    use('theprimeagen/harpoon')

    use('tpope/vim-fugitive')

    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    })
end)
