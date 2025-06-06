local M = {}

M.opts = {
	title = '[tailwind]',
	on_open = function(win)
		local buf = vim.api.nvim_win_get_buf(win)
		-- display the output as markdown
		vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
	end
}

local function get_project_root()
	local cwd = vim.fn.getcwd()
	local root = vim.fn.findfile("tailwind.config.js", cwd .. ";")
	if root ~= "" then
		return vim.fn.fnamemodify(root, ":h")
	end
	root = vim.fn.finddir(".git", cwd .. ";")
	if root ~= "" then
		return vim.fn.fnamemodify(root, ":h")
	end
end

local function jobstart()
	-- Resolve project root based on presence of tailwind.config.js or .git
	local root = get_project_root()

	local config = M.get_config()

	-- Input and output relative to project root
	local input = root .. config.input
	local output = root .. config.output
	local minify = config.minify and "--minify" or ""

	-- Ensure paths exist
	if vim.fn.filereadable(input) == 0 then
		vim.notify("Input file not found: " .. input, vim.log.levels.ERROR, M.opts)
		return
	end
	if vim.fn.filewritable(output) == 0 then
		vim.notify("Output file not found, or could not be written: " .. input, vim.log.levels.ERROR, M.opts)
		return
	end

	vim.fn.jobstart(
		{
			"npx", "tailwindcss",
			"-i", input,
			"-o", output,
			minify
		}
		, {
			stdin = "null", -- Remove stdin input requirement, daemonlike
			stdout_buffered = true,
			stderr_buffered = true,
			detach = true,
			on_exit = function(_, code, _)
				if code == 0 then
					vim.notify("Successfully written " .. output, vim.log.levels.INFO, M.opts)
				end
			end,
			on_stderr = function(_, err, _)
				local done_in = "Done in "
				err = err or {}
				-- assumes that Tailwind outputs 'Done in xxms', exit code is still 0
				if string.find(err[3],done_in) then
					return
				end
				if err[3] then
					vim.notify(err[3], vim.log.levels.ERROR, M.opts)
				else
					vim.notify("Could not write " .. output, vim.log.levels.ERROR, M.opts)
				end
			end
		})
end

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.html", "*.css", "*.js", "*.ts" },
	callback = function()
		-- Start Tailwind build
		jobstart()
	end,
})

TailwindConfig = TailwindConfig or {}

function M.setup(config)
	-- Empty config table
	if not config then
		config = {}
	end
	local global_settings = {
		["input"] = "/static/css/input.css",
		["output"] = "/static/css/style.css",
		["minify"] = true,
	}
	TailwindConfig = global_settings
end

function M.get_config()
	return TailwindConfig
end

return M
