local gh = function(path) return 'https://github.com/' .. path end

vim.pack.add({
    gh'nvim-lua/plenary.nvim',
    gh'nvim-tree/nvim-web-devicons',

    gh'nvim-telescope/telescope.nvim',
    gh'nvim-telescope/telescope-ui-select.nvim',
    gh'nvim-telescope/telescope-fzf-native.nvim',
    gh'folke/trouble.nvim',

    gh'romus204/tree-sitter-manager.nvim',
    { src = gh'nvim-treesitter/nvim-treesitter-textobjects', version = 'main', },

    gh'neovim/nvim-lspconfig',
    gh'mason-org/mason.nvim',
    gh'mason-org/mason-lspconfig.nvim',
    gh'seblyng/roslyn.nvim',

    { src = gh'catppuccin/nvim', name = 'catppuccin-nvim', },
    gh'folke/tokyonight.nvim',
})

require('plugins.telescope')
require('plugins.trouble')
require('plugins.tree-sitter')
require('plugins.lsp')
