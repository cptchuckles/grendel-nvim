local M = {}

M.setup = function(augroup)
    local ts = require('telescope.builtin')

    vim.keymap.set('n', '<leader>*', ts.grep_string, { desc = 'Telescope grep_string' })
    vim.keymap.set('n', '<leader>tf', ts.find_files, { desc = 'Telescope find_files' })
    vim.keymap.set('n', '<leader>b', ts.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>tg', ts.git_files, { desc = 'Telescope git_files' })
    vim.keymap.set('n', '<leader>ti', ts.live_grep, { desc = 'Telescope live_grep' })
    vim.keymap.set('n', '<leader>tt', ts.resume, { desc = 'Telescope resume' })

    vim.api.nvim_create_autocmd('LspAttach', {
        group = augroup,
        callback = function(ev)
            vim.keymap.set('n', '<C-]>', ts.lsp_definitions, { buffer = ev.buf, desc = 'Telescope lsp_definitions' })
            vim.keymap.set('n', 'g<C-]>', ts.lsp_references, { buffer = ev.buf, desc = 'Telescope lsp_definitions' })
            vim.keymap.set('n', '<leader>di', ts.lsp_implementations, { buffer = ev.buf, desc = 'Telescope lsp_implementations' })
        end,
    })
end

return M
