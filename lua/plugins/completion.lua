return {
    {
        'rafamadriz/friendly-snippets',
        'L3MON4D3/LuaSnip',
        { src = 'saghen/blink.lib', version = 'main' },
        { src = 'saghen/blink.cmp', version = 'v1.10.2' },
    },

    config = function()
        require('luasnip.loaders.from_vscode').lazy_load()

        require('blink.cmp').setup({
            enabled = function()
                return not vim.tbl_contains({ 'text', 'markdown', 'csv', }, vim.bo.filetype)
            end,

            keymap = {
                preset = 'default',
            },
            appearance = {
                nerd_font_variant = 'normal',
                use_nvim_cmp_as_default = false,
            },
            fuzzy = {
                implementation = 'lua',
            },
            completion = {
                menu = { auto_show = true, },
                accept = {
                    auto_brackets = { enabled = true, },
                },
                ghost_text = {
                    enabled = false,
                    show_with_menu = false,
                },
                documentation = { auto_show = true },
            },
            cmdline = {
                enabled = true,
                keymap = { preset = 'cmdline' },
                completion = {
                    menu = { auto_show = true },
                },
            },
            sources = {
                default = { 'lsp', 'buffer', 'path', 'omni' },
            },
            snippets = { preset = 'luasnip' },
        })
    end
}
