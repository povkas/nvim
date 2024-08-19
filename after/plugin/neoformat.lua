--vim.api.nvim_create_user_command("Format", function(args)
--    local range = nil
--    if args.count ~= -1 then
--        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
--        range = {
--            start = { args.line1, 0 },
--            ["end"] = { args.line2, end_line:len() },
--        }
--    end
--    require("conform").format({ async = true, lsp_format = "fallback", range = range })
--end, { range = true })
--
--vim.keymap.set("n", "<leader>nf", vim.cmd.Format);

vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
    else
        vim.g.disable_autoformat = true
    end
end, {
    desc = "Disable autoformat-on-save",
    bang = true,
})
vim.keymap.set("", "<leader>f", function()
    require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "[F]ormat" })
vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
end, {
    desc = "Re-enable autoformat-on-save",
})
vim.keymap.set("n", "<leader>F", function()
    if vim.b.disable_autoformat or vim.g.disable_autoformat then
        vim.cmd("FormatEnable")
    else
        vim.cmd("FormatDisable")
    end
end, { desc = "Toggle [F]ormat" })
