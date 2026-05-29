require('tree-sitter-manager').setup({
    auto_install = true,
    highlight = true,
    border = vim.o.winborder,

    ensure_installed = {
        'lua',
        'vim',
        'luadoc',
        'vimdoc',

        'bash',
        'python',

        'c',
        'cpp',
        'c_sharp',
        'rust',

        'html',
        'css',
        'javascript',

        'toml',
        'markdown',
        'yaml',
        'xml',
        'json',
    },
})

require('nvim-treesitter-textobjects').setup({
    select = {
        enable = true,
        lookahead = true,
        include_surrounding_whitespace = false,
    },
    swap = {
        enable = true,
    },
    move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
    },
})

require('settings.keymaps.tree-sitter')
