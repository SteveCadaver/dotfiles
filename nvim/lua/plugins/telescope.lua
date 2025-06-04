
--[[ Telescope ]]--
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<localleader>ff', builtin.find_files, {})
vim.keymap.set('n', '<localleader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<localleader>fb', builtin.buffers, {})
vim.keymap.set('n', '<localleader>fh', builtin.help_tags, {})

