local lsp = require('lsp-zero').preset({ "recommended" })

--lsp.on_attach(function(client, bufnr)
--    -- see :help lsp-zero-keybindings
--    -- to learn the available actions
--    lsp.default_keymaps({ buffer = bufnr, preserve_mappings = false })
--end)

require("mason").setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'tsserver', 'eslint', 'lua_ls', 'bashls' },
    handlers = {
        lsp.default_setup,
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
require('lspconfig').pyright.setup {}
require('lspconfig').tsserver.setup {}
require 'lspconfig'.jqls.setup {}

lsp.setup_servers({ 'jdtls' })

lsp.setup()

local cmp = require('cmp')

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})
