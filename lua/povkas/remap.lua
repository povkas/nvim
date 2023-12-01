vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>nf", vim.cmd.Neoformat);
vim.keymap.set("n", "<leader>ef", vim.cmd.EslintFixAll);

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", {})
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", {})
vim.api.nvim_set_keymap("n", "<C-f>", "<C-f>zz", {})
vim.api.nvim_set_keymap("n", "n", "nzzzv", {})
vim.api.nvim_set_keymap("n", "N", "Nzzzv", {})

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


local cmd = vim.cmd

cmd [[
    augroup vimrc
        autocmd!
        au TextYankPost * silent! lua vim.highlight.on_yank()
    augroup END
]]
--let g:tmux_navigator_no_mappings = 1
--nvim.keymap.set("n", <silent> <c-k> :TmuxNavigateUp<cr>
--vim.keymap.set(nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
--vim.keymap.set(nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
--vim.keymap.set(nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
--" Disable tmux navigator when zooming the Vim pane
--let g:tmux_navigator_disable_when_zoomed = 1
