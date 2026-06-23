return {
    {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'windwp/nvim-autopairs',
        'NMAC427/guess-indent.nvim',
        'lewis6991/gitsigns.nvim',
        'hedyhli/outline.nvim',
    },

    config = function()
        require('nvim-autopairs').setup({
            enable_autoquote = true,
            check_ts = true,
            ts_config = {
                lua = { 'string' },
                java = false,
            },
        })

        require('gitsigns').setup({
            current_line_blame = true,
            current_line_blame_opts = {
                delay = 200,
            },

            on_attach = function(bufnr)
                local gs = require('gitsigns')
                vim.keymap.set('n', '[c', function() gs.nav_hunk('prev', { preview = true}) end, { buf = bufnr, desc = 'Git jump to previous hunk' })
                vim.keymap.set('n', ']c', function() gs.nav_hunk('next', { preview = true}) end, { buf = bufnr, desc = 'Git jump to next hunk' })
                vim.keymap.set('n', '<leader>gs', gs.stage_hunk, { buf = bufnr, desc = 'Git stage hunk' })
                vim.keymap.set('n', '<leader>gr', gs.reset_hunk, { buf = bufnr, desc = 'Git reset hunk' })
                vim.keymap.set('n', '<leader>gg', function() gs.setloclist(0, "all") end, { buf = bufnr, desc = 'Git hunks to loclist' })
                vim.keymap.set('n', '<leader>gS', gs.stage_buffer, { buf = bufnr, desc = 'Git stage buffer' })
                vim.keymap.set('n', '<leader>gR', gs.reset_buffer, { buf = bufnr, desc = 'Git reset buffer' })
                vim.keymap.set('n', '<leader>gB', gs.toggle_current_line_blame, { buf = bufnr, desc = 'Git toggle inline blame' })
                vim.keymap.set('n', '<leader>gb', function() gs.blame_line({ full = true }) end, { buf = bufnr, desc = 'Git show current line blame' })
                vim.keymap.set('n', '<leader>gp', gs.preview_hunk, { buf = bufnr, desc = 'Git preview hunk' })
            end,
        })

        require('outline').setup({
            outline_window = { auto_jump = true },
            auto_preview = true,
            min_width = 80,
        })
        vim.keymap.set('n', '<leader>E', require('outline').open, { desc = 'Open symbol outline' })

        require('guess-indent').setup()
    end
}
