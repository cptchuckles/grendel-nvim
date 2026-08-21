return {
    {
        'MunifTanjim/nui.nvim',
        {
            src = 'nvim-neo-tree/neo-tree.nvim',
            name = 'neo-tree',
            version = vim.version.range('3'),
        }
    },

    config = function()
        local neotree_ok, neotree = pcall(require, 'neo-tree')
        if not neotree_ok then
            print('Could not load neo-tree')
            return
        end

        neotree.setup({
            filesystem = {
                hijack_netrw_behavior = 'open_current',
            },
        })

        vim.keymap.set('n', '<leader>e', '<Cmd>Neotree action=show position=current toggle=true reveal_force_cwd<CR>', { desc = 'Toggle NeoTree'})

        vim.api.nvim_create_autocmd('ColorScheme', {
            group = vim.api.nvim_create_augroup('NeoTreeFixHighlights', { clear = true }),
            callback = function()
                vim.api.nvim_set_hl(0, 'NeoTreeNormal', { link = 'NormalFloat', force = true})
                vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { link = 'NormalFloat', force = true})
            end,
        })
    end
}
