
--[[ Setup Comment plugin ]]--
local conform = require("conform")

local opts = { 
	title = '[conform]',
	on_open = function(win)
		local buf = vim.api.nvim_win_get_buf(win)
		vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
	end
}

conform.setup({
	formatters_by_ft = {
		css = {  "prettier", stop_after_first = true },
		html = {  "prettier", stop_after_first = true },
		javascript = {  "prettier", stop_after_first = true },
		-- Conform will run multiple formatters sequentially
		-- Use a sub-list to run only the first available formatter
		rust = { "rustfmt" },
	},
	formatters = {
		prettier = {
		},
	},
})

vim.keymap.set({ "n", "v" }, "<space>f", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	}, function(err, did_edit)
		if did_edit then
			-- TODO capture the following logic in a function.
			-- Get visual mode start and end positions
			local start_pos = vim.fn.getpos("v")
			local end_pos = vim.fn.getpos(".")
			local start_line = math.min(start_pos[2], end_pos[2])
			local end_line = math.max(start_pos[2], end_pos[2])

			local lines = ""
			local filetype = vim.bo.filetype
			if end_line - start_line > 20 then
				end_line = start_line + 20
				lines = table.concat(vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false), '\n') .. '\n\t...'
			else
				lines = table.concat(vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false), '\n')
			end
			-- Get lines from buffer
			vim.notify("Formatting successful.\n```" .. filetype .. "\n" .. lines .. '\n```', vim.log.levels.INFO, opts)
		else
			if not err then
				vim.notify("Nothing to format.", vim.log.levels.WARN, opts)
				return
			end
				vim.notify(err, vim.log.levels.ERROR, opts)
		end
	end)
end, { desc = "Format file or range (in visual mode)" })
