return {
    {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'windwp/nvim-autopairs',
        'NMAC427/guess-indent.nvim',
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

        require('guess-indent').setup()
    end
}
