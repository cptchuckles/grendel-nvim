local trouble_ok, trouble = pcall(require, 'trouble')
if not trouble_ok then
    print('Could not load Trouble')
    return
end

trouble.setup({
    auto_jump = true,
    focus = true,
    modes = {
        lsp_base = {
            params = { include_current = true },
        },
    },
})

vim.keymap.set('n', '<leader>dd', function()
    trouble.open({ mode = 'diagnostics' })
end, { desc = 'Trouble lsp_diagnostics' })

vim.keymap.set('n', 'g*', function()
    vim.cmd.lvimgrep('//gj', '%')
    trouble.open({ mode = 'loclist' })
end, { desc = 'Send last search to qflist and open with Trouble' })
