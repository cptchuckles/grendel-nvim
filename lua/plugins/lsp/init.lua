vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT', },
            workspace = {
                preloadFileSize = 10000,
                library = {
                    vim.env.VIMRUNTIME,
                },
            },
        },
    },
})

require('mason').setup({
    registries = {
        'github:mason-org/mason-registry',
        'github:Crashdummyy/mason-registry',
    },
})

require('mason-lspconfig').setup({
    automatic_enable = true,
    ensure_installed = {
        'lua_ls',
        'vimls',

        'bashls',
        'pyrefly',

        'html',
        'cssls',
        'ts_ls',
        'emmet_language_server',

        'rust_analyzer',
    },
})
