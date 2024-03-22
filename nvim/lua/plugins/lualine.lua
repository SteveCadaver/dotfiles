
--[[ Lualine ]]--
require('lualine').setup({
	options = {
		--theme = "catppuccin",
		section_separators = { left = '', right = '' },
		component_separators = { left = '|', right = '|' },
		globalstatus = false,
		disabled_filetypes = { -- Filetypes to disable lualine for.
			statusline = {}, -- only ignores the ft for statusline.
			winbar = {},    -- only ignores the ft for winbar.
		},
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff'},-- diagnostic
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'progress'},-- fileformat
		lualine_y = {'filetype'},
		lualine_z = {'location'}
	},
	inactive_sections = {}
})

