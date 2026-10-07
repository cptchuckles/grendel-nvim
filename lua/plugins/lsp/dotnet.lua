return {
    {
        'folke/snacks.nvim',
        -- 'seblyng/roslyn.nvim',
        'GustavEikaas/easy-dotnet.nvim',
    },
    config = function()
        vim.env.PATH = vim.fn.expand("~/.dotnet/tools") .. ":" .. vim.env.PATH
        require('easy-dotnet').setup({
            picker = 'telescope',
            lsp = {
                enabled = true,
                auto_refresh_codelens = false,
                razor = {
                    enabled = true,
                    html = {
                        enabled = true,
                        cmd = nil,
                        request_timeout = 5000,
                    },
                },
            },
        })
    end,
}
