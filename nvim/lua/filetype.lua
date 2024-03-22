local vim = vim

--[[ FileType - python ]]--
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function(args)
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
		vim.opt.softtabstop = 2
		vim.opt.expandtab = false
  end
})

--[[ FileType - javascript ]]--
vim.api.nvim_create_autocmd("FileType", {
	pattern = "javascript",
	callback = function(args)
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
		vim.opt.softtabstop = 2
		vim.opt.expandtab = false
  end
})
