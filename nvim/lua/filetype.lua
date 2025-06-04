local vim = vim

--[[ FileType - python ]]--
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
		vim.opt.softtabstop = 2
		vim.opt.expandtab = false
  end
})

--[[ FileType - javascript ]]--
vim.api.nvim_create_autocmd("FileType", {
	pattern = "javascript",
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
		vim.opt.softtabstop = 2
		vim.opt.expandtab = false
  end
})

local function zig_test()

	local name = vim.api.nvim_buf_get_name(0)
	vim.cmd('!zig test ' .. name)
end

--[[ FileType - Zig ]]--
vim.api.nvim_create_autocmd("FileType", {
	pattern = "zig",
	callback = function()
		vim.opt.tabstop = 4
		vim.opt.shiftwidth = 4
		vim.opt.softtabstop = 4
		vim.opt.expandtab = false
		vim.keymap.set('n', '<localleader>br', ':!zig build run<Return>')
		vim.keymap.set('n', '<localleader>m', ':!zig build <Return>')
		vim.keymap.set('n', '<localleader>t', function () zig_test() end, { noremap = true })
  end
})
