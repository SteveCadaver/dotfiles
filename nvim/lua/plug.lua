--[[ Map `vim` keyword ]]--
local vim = vim

--[[ Required ]]--
local Plug = vim.fn['plug#']
vim.call('plug#begin')

--[[ NeoVim Official ]]--
Plug('neovim/nvim-lspconfig')

--[[ Autocompletion framework ]]--
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/cmp-path')

--[[ Autoformat ]]--
Plug('stevearc/conform.nvim')

--[[
--See hrsh7th other plugins for more great completion sources!
--Snippet engine
]]--
Plug('hrsh7th/vim-vsnip')
Plug('glepnir/lspsaga.nvim')

--[[ Adds extra functionality over rust analyzer ]]--
Plug('simrat39/rust-tools.nvim')

--[[ Theme and Colour ]]--
Plug('navarasu/onedark.nvim')
Plug('ap/vim-css-color')
Plug('catppuccin/nvim', { ['as'] = 'catppuccin' })

Plug('cespare/vim-toml')
Plug 'slim-template/vim-slim'

--[[ git ]]--
Plug('airblade/vim-gitgutter')

--[[ Utility ]]--
Plug('nvim-treesitter/nvim-treesitter', {
	['do'] = ':TSUpdate'
})
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-lualine/lualine.nvim')
--[[ Icons in your statusline choose one of these ]]--
Plug('nvim-tree/nvim-web-devicons')
Plug('christoomey/vim-tmux-navigator')
Plug('moll/vim-node')
Plug('mtdl9/vim-log-highlighting')
Plug('vimwiki/vimwiki')
Plug('907th/vim-auto-save')

--[[ Rust-Lang
-- Depricated view rustaceanvim
]]--
Plug('rust-lang/rust.vim')

vim.call('plug#end')

