
--[[ Lualine ]]--
require('lualine').setup({
	options = {
		--theme = "catppuccin",
		section_separators = { left = '', right = '' },
		component_separators = { left = '|', right = '|' }
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff'},-- diagnostic
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'progress'},-- fileformat
		lualine_y = {'filetype'},
		lualine_z = {'location'}
	},
})

