--[[ Map vim keyword ]]--
local vim = vim

--[[ Symbols used for Tab/Space/Trailing characters ]]--
vim.opt.list = true
vim.opt.listchars = { trail = '●', tab = "| ", space = "·" }

--[[ Disable selected -> Use Status line ]]--
vim.opt.showmode = false

--[[ Enable current line number and relative line numbers ]]--
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true

--[[ Enable highlights for line numbers ]]--
vim.cmd.highlight( { "LineNr", "ctermfg=DarkGrey", "guifg=DarkGrey" } )

--[[ Tabs and Indent ]]--
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

--[[ Clipboard ]]--
vim.opt.clipboard = "unnamed"

--[[ Mouse all modes ]]--
vim.opt.mouse = "a"
