local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

vim.api.nvim_set_keymap("n", "<Leader><Leader>",
    [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
    { noremap = true, silent = true })

require("telescope").setup {
  defaults = {
    -- Your regular Telescope's options.
  },
  extensions = {
    recent_files = {
     -- This extension's options, see below.
      only_cwd = true
    }
  }
}


