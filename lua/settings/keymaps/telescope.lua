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
            vim.api.nvim_buf_set_keymap(ev.buf, 'n', '<C-]>', '<cmd>Telescope lsp_definitions<CR>', { desc = 'Telescope lsp_definitions' })
            vim.api.nvim_buf_set_keymap(ev.buf, 'n', 'g<C-]>', '<cmd>Telescope lsp_references<CR>', { desc = 'Telescope lsp_definitions' })
            vim.api.nvim_buf_set_keymap(ev.buf, 'n', '<leader>di', '<cmd>Telescope lsp_implementations<CR>', { desc = 'Telescope lsp_implementations' })
        end,
    })
end

return M
