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
