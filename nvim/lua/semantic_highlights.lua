local vim = vim
-- You can add this in your init.lua
-- this should be executed before setting the colorscheme
local function hide_semantic_highlights()
	for _, group in ipairs(vim.fn.getcompletion('@lsp', 'highlight')) do
		vim.api.nvim_set_hl(0, group, {})
	end
end

vim.api.nvim_create_autocmd('ColorScheme', {
	desc = 'Clear LSP highlight groups',
	callback = hide_semantic_highlights,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "@vim_builtin", { fg = "#ff9e64" })
	end,
})
