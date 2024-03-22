

local conform = require("conform").setup({
	formatters_by_ft = {
		-- Conform will run multiple formatters sequentially
		-- Use a sub-list to run only the first available formatter
		rust = { "rustfmt" },
	},
})
vim.keymap.set({ "n", "v" }, "<space>f", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file or range (in visual mode)" })
