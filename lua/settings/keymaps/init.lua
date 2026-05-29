vim.keymap.set('n', '<leader>s', [[<cmd>set hls!<CR>]], { desc = 'Toggle highlight search' })
vim.keymap.set('n', '<leader>w', [[<cmd>set wrap!<CR>]], { desc = 'Toggle word wrap' })

-- locomotion
local function do_feedkeys(s, mode)
    local keysequence = vim.api.nvim_replace_termcodes(s, true, false, true)
    vim.api.nvim_feedkeys(keysequence, mode, true)
end
vim.keymap.set('n', '<C-e>', function() do_feedkeys(vim.g.scrollspeed .. '<C-e>', 'n') end, { desc = 'Fast scroll down' })
vim.keymap.set('n', '<C-y>', function() do_feedkeys(vim.g.scrollspeed .. '<C-y>', 'n') end, { desc = 'Fast scroll up' })

vim.keymap.set('n', 'j', 'gj', { desc = 'Travel wrapped lines like normal' })
vim.keymap.set('n', 'k', 'gk', { desc = 'Travel wrapped lines like normal' })

-- navigation
vim.keymap.set('n', '<Leader>e', '<cmd>Lex<CR>', { desc = 'Open Net-Rw' })
vim.keymap.set('n', '<C-n>', '<cmd>bnext<CR>', { desc = 'Go to next buffer' })
vim.keymap.set('n', '<C-p>', '<cmd>bprev<CR>', { desc = 'Go to previous buffer' })
vim.keymap.set('n', '<A-l>', '<cmd>ls<CR>:b', { desc = 'List buffers' })
vim.keymap.set('n', '<C-q>', function() vim.api.nvim_buf_delete(0, { force = true }) end, { desc = 'Quick-delete buffer' })

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to window to left' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to window below' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to window above' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to window to right' })

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half-page down, center cursor' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half-page up, center cursor' })

vim.keymap.set('n', ']d', function()
    vim.diagnostic.jump({ diagnostic = vim.diagnostic.get_next(), float = true })
end, { desc = 'Jump to next diagnostic with float' })
vim.keymap.set('n', '[d', function()
    vim.diagnostic.jump({ diagnostic = vim.diagnostic.get_prev(), float = true })
end, { desc = 'Jump to prev diagnostic with float' })

-- editing
vim.keymap.set('n', '<A-j>', '<cmd>move .+1<CR>==', { desc = 'Move current line down' })
vim.keymap.set('n', '<A-k>', '<cmd>move .-2<CR>==', { desc = 'Move current line up' })
vim.keymap.set('v', '<A-k>', [[:move '<-2<CR>gv=gv]], { desc = 'Move selected lines up' })
vim.keymap.set('v', '<A-j>', [[:move '>+1<CR>gv=gv]], { desc = 'Move selected lines down' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent visual selection' })
vim.keymap.set('v', '<', '<gv', { desc = 'Un-indent visual selection' })
vim.keymap.set('n', 'g/', [[<cmd>lvimgrep //gj %<CR><cmd>lopen<CR>]], { desc = 'Fill location list with search results' })

vim.keymap.set('n', '<A-i>', vim.diagnostic.open_float, { desc = 'Show floating diagnostic at cursor' })

-- autocommands
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('QuickCloseBuffers', { clear = true }),
    pattern = { 'help', 'netrw', 'qf' },
    callback = function(ev)
        vim.keymap.set('n', 'q', function()
            vim.cmd.lclose()
            local winid = vim.fn.bufwinid(ev.buf)
            if winid < 0 then return end
            vim.cmd.wincmd('p')
            vim.api.nvim_win_close(winid, true)
        end, { buffer = ev.buf, desc = 'Quick-close buffers for some filetypes' })
    end,
})
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('NetrwRemoveKeymaps', { clear = true }),
    pattern = { 'netrw' },
    callback = function(ev)
        pcall(function() vim.api.nvim_buf_del_keymap(ev.buf, 'n', '<C-l>') end)
        pcall(function() vim.api.nvim_buf_del_keymap(ev.buf, 'n', '<C-h>') end)
    end,
})
