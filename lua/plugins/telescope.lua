require('telescope').setup({
    extensions = {
        ['ui-select'] = {
            require('telescope.themes').get_cursor()
        },
    },
})

local telescope_group = vim.api.nvim_create_augroup('TelescopeAugroup', { clear = true })

require('settings.keymaps.telescope').setup(telescope_group)

-- Disable autocomplete in Telescope prompt window
vim.api.nvim_create_autocmd('FileType', {
    group = telescope_group,
    pattern = 'TelescopePrompt',
    callback = function() vim.bo.autocomplete = false end,
})
