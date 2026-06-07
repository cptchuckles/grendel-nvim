return {
    {
        'neovim/nvim-lspconfig',
        'mason-org/mason.nvim',
        'mason-org/mason-lspconfig.nvim',
        'seblyng/roslyn.nvim',
    },

    config = function()
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

        local have_blink, blink = pcall(require, 'blink.cmp')
        if have_blink then
            vim.lsp.config('*', {
                capabilities = blink.get_lsp_capabilities(
                    vim.lsp.protocol.make_client_capabilities()
                )
            })
        else
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('LspCompletionAugroup', { clear = true }),
                callback = function(ev)
                    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
                    if client:supports_method('textDocument/completion') then
                        vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
                    end
                end,
            })
        end
    end
}
