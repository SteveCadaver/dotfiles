--[[ Theme ]]--
require('onedark').setup {
	style = 'darker',
	term_colors = true,

	-- Change code style ---
	-- Options are italic, bold, underline, none
	-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
	code_style = {
		comments = 'bold',
		keywords = 'none',
		functions = 'none',
		strings = 'none',
		variables = 'none'
	},
	-- Lualine options --
	lualine = {
		transparent = false, -- lualine center bar transparency
	},
	diagnostics = {
		darker = true,
		undercurl = false
	}
}
require('onedark').load()
