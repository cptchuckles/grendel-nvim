local ts_select = require('nvim-treesitter-textobjects.select')
local ts_move = require('nvim-treesitter-textobjects.move')
-- local ts_repeat_move = require('nvim-treesitter-textobjects.repeatable_move')
local ts_swap = require('nvim-treesitter-textobjects.swap')

vim.keymap.set('n', '<leader>a', function()
  ts_swap.swap_next('@parameter.inner')
end, { desc = 'Swap with next tree-sitter parameter' })

vim.keymap.set('n', '<leader>A', function()
  ts_swap.swap_previous('@parameter.inner')
end, { desc = 'Swap with previous tree-sitter parameter' })

-- You can use the capture groups defined in `textobjects.scm`
vim.keymap.set({ 'x', 'o' }, 'af', function()
  ts_select.select_textobject('@function.outer', 'textobjects')
end, { desc = 'Select around tree-sitter function' })
vim.keymap.set({ 'x', 'o' }, 'if', function()
  ts_select.select_textobject('@function.inner', 'textobjects')
end, { desc = 'Select inside tree-sitter function' })
vim.keymap.set({ 'x', 'o' }, 'ac', function()
  ts_select.select_textobject('@class.outer', 'textobjects')
end, { desc = 'Select around tree-sitter class' })
vim.keymap.set({ 'x', 'o' }, 'ic', function()
  ts_select.select_textobject('@class.inner', 'textobjects')
end, { desc = 'Select inside tree-sitter class' })
-- You can also use captures from other query groups like `locals.scm`
vim.keymap.set({ 'x', 'o' }, 'as', function()
  ts_select.select_textobject('@local.scope', 'locals')
end, { desc = 'Select around tree-sitter scope' })

-- You can use the capture groups defined in `textobjects.scm`
vim.keymap.set({ 'n', 'x', 'o' }, ']m', function()
  ts_move.goto_next_start('@function.outer', 'textobjects')
end, { desc = 'Jump to next start of tree-sitter function' })
vim.keymap.set({ 'n', 'x', 'o' }, ']]', function()
  ts_move.goto_next_start('@class.outer', 'textobjects')
end, { desc = 'Jump to next start of tree-sitter class' })
-- You can also pass a list to group multiple queries.
vim.keymap.set({ 'n', 'x', 'o' }, ']o', function()
  ts_move.goto_next_start({'@loop.inner', '@loop.outer'}, 'textobjects')
end, { desc = 'Jump to next start of tree-sitter loop' })
-- You can also use captures from other query groups like `locals.scm` or `folds.scm`
vim.keymap.set({ 'n', 'x', 'o' }, ']s', function()
  ts_move.goto_next_start('@local.scope', 'locals')
end, { desc = 'Jump to next start of tree-sitter scope' })

vim.keymap.set({ 'n', 'x', 'o' }, ']M', function()
  ts_move.goto_next_end('@function.outer', 'textobjects')
end, { desc = 'Jump to next end of tree-sitter function' })
vim.keymap.set({ 'n', 'x', 'o' }, '][', function()
  ts_move.goto_next_end('@class.outer', 'textobjects')
end, { desc = 'Jump to next end of tree-sitter class' })

vim.keymap.set({ 'n', 'x', 'o' }, '[m', function()
  ts_move.goto_previous_start('@function.outer', 'textobjects')
end, { desc = 'Jump to previous start of tree-sitter function' })
vim.keymap.set({ 'n', 'x', 'o' }, '[[', function()
  ts_move.goto_previous_start('@class.outer', 'textobjects')
end, { desc = 'Jump to previous start of tree-sitter class' })

vim.keymap.set({ 'n', 'x', 'o' }, '[M', function()
  ts_move.goto_previous_end('@function.outer', 'textobjects')
end, { desc = 'Jump to previous end of tree-sitter function' })
vim.keymap.set({ 'n', 'x', 'o' }, '[]', function()
  ts_move.goto_previous_end('@class.outer', 'textobjects')
end, { desc = 'Jump to previous end of tree-sitter class' })


-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
-- vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
-- vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)
