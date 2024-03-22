--[[ Semantic Highlighting ]]--
require("semantic_highlights")

vim.cmd("source ~/.config/nvim/legacy/init.vim")

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

--[[ Rust-Tools - Rust Specific LSP tools ]]--
require("plugins.rust-tools")
