local M = {}

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

-- Clear the notification window after timeout
-- period delay.
--
local function clear_notification(timeout)
	vim.defer_fn(function()
		vim.api.nvim_echo({}, false, {})
	end, timeout)
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
		vim.notify("Tailwind input file not found: " .. input, vim.log.levels.WARN)
		return
	end
	if vim.fn.filewritable(output) == 0 then
		vim.notify("Tailwind output file not found, or could not be written: " .. input, vim.log.levels.WARN)
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
					vim.schedule(function()
						vim.api.nvim_echo({
							{ "[tailwindcss] ", "String" },
						}, false, {})
						clear_notification(2000)
					end)
				else
					vim.schedule(function()
						vim.notify("[tailwindcss]   : " .. code, vim.log.levels.ERROR)
					end)
				end
			end,
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
