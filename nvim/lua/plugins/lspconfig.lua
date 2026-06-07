--[[ Map 'vim' keyword ]]--
local vim = vim

--[[ Configure Lua Lsp - [lua_ls] ]]--
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT", -- Neovim uses LuaJIT
				path = vim.split(package.path, ';'),
			},
			diagnostics = {
				globals = {
					"vim"
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true), -- this grabs all runtime files
				checkThirdParty = false,                   -- Optional: disable third-party popups
			},
			telemetry = { enable = false },
		}
	}
})

--[[ Configure TailWindCSS Lsp ]]--
vim.lsp.enable("tailwindcss")

--[[ Configure Python Lsp ]]--
vim.lsp.enable("pylsp")

--[[ Configure Zig Lsp ]]--
vim.lsp.enable("zls")

--[[ Configure Typescript Lsp ]] --
vim.lsp.config("ts_ls", {
	-- Initial options for the TypeScript language server
	init_options = {
		plugins = {
			{
				-- Name of the TypeScript plugin for Vue
				name = '@vue/typescript-plugin',

				-- Location of the Vue language server module (path defined in step 1)
				location = '/usr/local/lib/node_modules/@vue/typescript-plugin',

				-- Specify the languages the plugin applies to (in this case, Vue files)
				languages = { 'vue' },
			},
		},
	},

	-- Specify the file types that will trigger the TypeScript language server
	filetypes = {
		'typescript',        -- TypeScript files (.ts)
		'javascript',        -- JavaScript files (.js)
		'javascriptreact',   -- React files with JavaScript (.jsx)
		'typescriptreact',   -- React files with TypeScript (.tsx)
		'vue'                -- Vue.js single-file components (.vue)
	},
})

vim.lsp.enable("jinja_lsp")
