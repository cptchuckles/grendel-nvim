-- essential settings
vim.g.mapleader = '\\'
vim.g.localleader = ','
vim.opt.path:append('**')

-- appearance and behavior
vim.o.signcolumn = 'yes'
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.colorcolumn = '100'
vim.o.breakindent = true
vim.o.laststatus = 2
vim.o.cmdheight = 1
vim.o.scrolloff = 4
vim.o.visualbell = true

vim.o.list = true
vim.opt.listchars = {
    tab = '→ ',
    leadtab = '│ ',
    trail = '§',
    leadmultispace = '│⋅⋅⋅',
}
vim.api.nvim_create_autocmd('OptionSet', {
    group = vim.api.nvim_create_augroup('ShiftwidthChangedAugroup', { clear = true }),
    pattern = 'shiftwidth',
    callback = function()
        vim.opt.listchars:append({
            leadmultispace = '│' .. string.rep('·', vim.o.shiftwidth - 1)
        })
    end,
})

vim.o.pumheight = 12
vim.o.pumwidth = 20
vim.o.pummaxwidth = 40
vim.o.pumblend = 0
vim.o.pumborder = 'rounded'
vim.o.winborder = 'rounded'

-- editing settings
vim.g.scrollspeed = 3
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.opt.cinwords:append({ 'case', 'elif', 'match' })
vim.opt.clipboard:append('unnamedplus')
vim.o.virtualedit = 'block'

-- completion settings
vim.opt.autocomplete = true
vim.opt.complete:append('o')
vim.opt.completeopt = { 'popup', 'fuzzy', 'menuone', 'noselect', 'preview' }
vim.opt.wildmenu = true
vim.opt.wildignore:append({ '*.o', '*.a', '*.obj', '*.class', '*.s' })
vim.opt.wildmode = { 'noselect:lastused', 'full' }
vim.opt.wildoptions = { 'fuzzy', 'pum' }

vim.api.nvim_create_autocmd('CmdlineChanged', {
    group = vim.api.nvim_create_augroup('CmdlineAugroup', { clear = true }),
    pattern = { ':', '/', '?' },
    callback = function() vim.fn.wildtrigger() end,
})


-- netrw settings
vim.g.netrw_liststyle = 3     -- tree style listing
vim.g.netrw_browse_split = 4  -- open file in previous window
vim.g.netrw_banner = 0        -- no banner
vim.g.netrw_usetab = 1        -- use netrw-<C-Tab> mapping
vim.g.netrw_wiw = 32          -- window width (cols)
vim.g.shada = "'0f0"          -- what to save in the ShaDa file
