
--[[ Diagnostics Start ]]--

-- Set updatetime for CursorHold
-- 300ms of no cursor movement to trigger CursorHold
vim.opt.updatetime = 100

-- You can add this in your init.lua
-- or a plugin script

local function sign_define(args)
	vim.fn.sign_define(args.name, {
		texthl = args.name,
		text = args.text,
		numhl = ''
	})
end

sign_define({name = 'DiagnosticSignError', text = ''})
sign_define({name = 'DiagnosticSignWarn', text = ''})
sign_define({name = 'DiagnosticSignHint', text = ''})
sign_define({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
	float = {
		border = 'rounded',
	},
})

-- Show diagnostic popup on cursor hover
local diag_float_grp = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focusable = false })
	end,
	group = diag_float_grp,
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'g]', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- have a fixed column for the diagnostics to appear in
-- this removes the jitter when warnings/errors flow in
vim.wo.signcolumn = "yes"

--[[ Diagnostics End ]]--
