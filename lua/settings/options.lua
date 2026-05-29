-- essential settings
vim.g.mapleader = '\\'
vim.g.localleader = ','

-- appearance and behavior
vim.o.signcolumn = "yes"
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.colorcolumn = "100"
vim.o.breakindent = true
vim.o.laststatus = 2
vim.o.cmdheight = 1
vim.o.scrolloff = 4

vim.o.list = true
vim.opt.listchars = {
    tab = "  ",
    leadtab = " ",
    trail = "§",
    leadmultispace = "│⋅⋅⋅",
}

vim.o.pumblend = 0
vim.o.pumborder = "rounded"
vim.o.winborder = "rounded"

vim.opt.wildignore:append({ "*.o", "*.a", "*.obj", "*.class", "*.s" })
vim.o.wildmenu = true
vim.o.wildmode = "full"

-- editing settings
vim.o.autocomplete = true
vim.g.scrollspeed = 3
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.opt.cinwords:append({ "case", "elif", "match" })
vim.opt.clipboard:append("unnamedplus")
vim.opt.completeopt:append({ "fuzzy", "noinsert", "preview" })

-- colorscheme autocommand
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
