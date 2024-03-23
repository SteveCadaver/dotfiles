-- Map vim keyword
local vim = vim

--[[ Switch Next/Prev Tab ]]--
vim.keymap.set('n', '<S-Tab>', ':tabprev<Return>')
vim.keymap.set('n', '<Tab>', ':tabnext<Return>')
