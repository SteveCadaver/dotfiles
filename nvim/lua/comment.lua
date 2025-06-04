--[[ Setup Comment plugin ]]--
require('Comment').setup()

-- Normal mode: Toggle comment for current line
vim.api.nvim_set_keymap('n', '<leader>/', '<Plug>(comment_toggle_linewise_current)', { noremap = true, silent = true })

-- Visual mode: Toggle comment for selected lines
vim.api.nvim_set_keymap('v', '<leader>/', '<Plug>(comment_toggle_linewise_visual)', { noremap = true, silent = true })
