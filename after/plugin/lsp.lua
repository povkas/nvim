local lsp = require('lsp-zero').preset({ "recommended" })

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })
end)

require("mason").setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'tsserver', 'eslint', 'lua_ls', 'bashls' },
    handlers = {
        lsp.default_setup,
        --        lua_ls = function()
        --            require('lspconfg').lua_ls.setup({lsp.nvim_lua_ls})
        --        end
    },
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr }

    vim.keymap.set({ 'n', 'x' }, 'gq', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, opts)
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').bashls.setup {}
require('lspconfig').eslint.setup {}
require("prettier").setup()

lsp.setup_servers({ 'jdtls' })
lsp.setup()
