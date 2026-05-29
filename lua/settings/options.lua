-- essential settings
vim.g.mapleader = '\\'
vim.g.localleader = ','

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

vim.o.list = true
vim.opt.listchars = {
    tab = '  ',
    leadtab = ' ',
    trail = '§',
    leadmultispace = '│⋅⋅⋅',
}

vim.o.pumblend = 0
vim.o.pumborder = 'rounded'
vim.o.winborder = 'rounded'

vim.opt.wildignore:append({ '*.o', '*.a', '*.obj', '*.class', '*.s' })
vim.o.wildmenu = true
vim.o.wildmode = 'full'
vim.opt.wildoptions = { 'fuzzy', 'pum' }

-- editing settings
vim.o.autocomplete = true
vim.g.scrollspeed = 3
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.opt.cinwords:append({ 'case', 'elif', 'match' })
vim.opt.clipboard:append('unnamedplus')
vim.opt.completeopt:append({ 'fuzzy', 'menu', 'menuone', 'noselect', 'preview' })

-- netrw settings
vim.g.netrw_liststyle = 3     -- tree style listing
vim.g.netrw_browse_split = 4  -- open file in previous window
vim.g.netrw_banner = 0        -- no banner
vim.g.netrw_usetab = 1        -- use netrw-<C-Tab> mapping
vim.g.netrw_wiw = 32          -- window width (cols)
vim.g.shada = "'0f0"          -- what to save in the ShaDa file
