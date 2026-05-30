local ts = require('telescope')
local actions = require('telescope.actions')
local themes = require('telescope.themes')

ts.setup({
    extensions = {
        ['ui-select'] = {
            themes.get_cursor()
        },
    },
    defaults = {
        sorting_strategy = 'ascending',
        prompt_prefix = ' ',
        selection_caret = ' ',
        multi_icon = ' ',
        msg_bg_fillchar = '?',

        path_display = { 'truncate' },
        dynamic_preview_title = true,

        winblend = 10,
        layout_strategy = 'flex',
        layout_config = {
            flex = {
                flip_columns = 200,
                flip_lines = 1,
            },
        },

        pickers = {
            lsp_references = {
                themes.get_dropdown(),
                show_line = false,
            },
        },

        mappings = {
            i = {
                ['<A-esc>'] = function() vim.cmd.stopinsert() end,
                ['<esc>'] = actions.close,

                ['<A-j>'] = actions.move_selection_next,
                ['<A-k>'] = actions.move_selection_previous,

                ['<PageDown>'] = actions.preview_scrolling_down,
                ['<PageUp>'] = actions.preview_scrolling_up,
                ['<C-d>'] = actions.results_scrolling_down,
                ['<C-u>'] = actions.results_scrolling_up,

                ['<C-_>'] = actions.which_key,
            },
            n = {
                ['?'] = actions.which_key,
            },
        },
    },
})

ts.load_extension('ui-select')

local telescope_group = vim.api.nvim_create_augroup('TelescopeAugroup', { clear = true })

---@diagnostic disable-next-line: different-requires
require('settings.keymaps.telescope').setup(telescope_group)

-- Disable autocomplete in Telescope prompt window
vim.api.nvim_create_autocmd('FileType', {
    group = telescope_group,
    pattern = 'TelescopePrompt',
    callback = function() vim.bo.autocomplete = false end,
})
