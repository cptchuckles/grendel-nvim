return {
    {
        'nvim-telescope/telescope.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        'nvim-telescope/telescope-fzf-native.nvim',
    },

    config = function()
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
        local builtins = require('telescope.builtin')

        vim.keymap.set('n', '<leader>*', builtins.grep_string, { desc = 'Telescope grep_string' })
        vim.keymap.set('n', '<leader>tf', builtins.find_files, { desc = 'Telescope find_files' })
        vim.keymap.set('n', '<leader>b', builtins.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>tg', builtins.git_files, { desc = 'Telescope git_files' })
        vim.keymap.set('n', '<leader>ti', builtins.live_grep, { desc = 'Telescope live_grep' })
        vim.keymap.set('n', '<leader>tt', builtins.resume, { desc = 'Telescope resume' })

        vim.api.nvim_create_autocmd('LspAttach', {
            group = telescope_group,
            callback = function(ev)
                vim.keymap.set('n', '<C-]>', builtins.lsp_definitions, { buffer = ev.buf, desc = 'Telescope lsp_definitions' })
                vim.keymap.set('n', 'g<C-]>', builtins.lsp_references, { buffer = ev.buf, desc = 'Telescope lsp_definitions' })
                vim.keymap.set('n', '<leader>di', builtins.lsp_implementations, { buffer = ev.buf, desc = 'Telescope lsp_implementations' })
            end,
        })

        -- Disable autocomplete in Telescope prompt window
        vim.api.nvim_create_autocmd('FileType', {
            group = telescope_group,
            pattern = 'TelescopePrompt',
            callback = function() vim.bo.autocomplete = false end,
        })
    end
}
