--[[ Map `vim` keyword ]]--
local vim = vim

--[[ Semantic Highlighting ]]--
require("semantic_highlights")

--[[ Vim Plug ]]--
require("plug")

--[[ Enable syntax Highlighting ]]--
vim.cmd.syntax("on")

--[[ Enables 24-bit RGB color ]]--
vim.opt.termguicolors = true

--[[ Remap vim.notify to nvim-notify ]]--
vim.notify = require('notify')

--[[ Code Comment]]--
require("comment")

--[[ Theme ]]--
require("theme")

--[[ Options ]]--
require("options")

--[[ Mappings ]]--
require("mappings")

--[[ FileType ]]--
require("filetype")

--[[ Diagnostis ]]--
require("diagnostics")

--[[ Telescope - Fuzzy Finder ]]--
require("plugins.telescope")

--[[ LSPconfig - Language Server Config ]]--
require("plugins.lspconfig")

--[[ Cmp - Code Completion ]]--
require("plugins.cmp")

--[[ Conform - Code formatting ]]--
require("plugins.conform")

--[[ Lualine - Editor Status Bar ]]--
require("plugins.lualine")

--[[ rustaceanvim - Rust Specific LSP tools ]]--
require("plugins.rustaceanvim")

--[[ Harpoon ]]--
require("plugins.harpoon")

--[[ Tailwind ]]--
require("plugins.tailwind").setup({})

--[[ TreeSitter ]]--
require("plugins.treesitter")
