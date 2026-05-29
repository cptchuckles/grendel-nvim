vim.g.clearbg = true

vim.g.forcebg = {
    blue = true,
    darkblue = true,
    default = true,
    delek = true,
    habamax = true,
    lunaperche = true,
    sorbet = true,
    zellner = true,
}

vim.api.nvim_create_autocmd('ColorScheme', {
    group = vim.api.nvim_create_augroup('ClearColorScheme', { clear = true }),
    callback = function(ev)
        if vim.g.forcebg[ev.match] ~= nil then return end
        if vim.g.clearbg then
            vim.api.nvim_set_hl(0, "Normal", { bg = 'none' })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = 'none' })
            vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = 'none' })
            vim.api.nvim_set_hl(0, "Pmenu", { bg = 'none' })
        end
    end,
})

vim.api.nvim_create_user_command('ClearBg', function()
    vim.g.clearbg = not vim.g.clearbg
    vim.cmd.colorscheme(vim.g.colors_name)
end, { desc = 'Toggle g:clearbg and reset current colorscheme' })

local scheme = vim.fn.environ()['NVIM_COLORSCHEME'] or 'default'
local succor = pcall(function()
    vim.cmd.colorscheme(scheme)
end)
if succor == false then
    print('Colorscheme not found: ' .. scheme)
end
