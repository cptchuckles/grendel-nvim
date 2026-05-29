vim.g.clearbg = true
vim.g.forcebg = {
    'default',
    'zellner',
    'delek',
    'sorbet',
    'habamax',
    'lunaperche',
    'blue',
    'darkblue',
}

vim.api.nvim_create_autocmd('ColorScheme', {
    group = vim.api.nvim_create_augroup('ClearColorScheme', { clear = true }),
    callback = function(ev)
        local bg_setting = vim.g.clearbg and "none" or nil
        for i, theme in ipairs(vim.g.forcebg) do
            if ev.match == theme then
                bg_setting = nil
            end
        end
        if vim.g.clearbg and bg_setting then
            vim.api.nvim_set_hl(0, "Normal", { bg = bg_setting })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = bg_setting })
            vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = bg_setting })
            vim.api.nvim_set_hl(0, "Pmenu", { bg = bg_setting })
        end
    end,
})
