
--[[ Configure Lua Lsp - [lua_ls] ]]--
require("lspconfig").lua_ls.setup {
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
}

--[[ Configure TailWindCSS Lsp ]]--
require("lspconfig").tailwindcss.setup{}

--[[ Configure Python Lsp ]]--
require("lspconfig").pylsp.setup{}

--[[ Configure Zig Lsp ]]--
require("lspconfig").zls.setup{}

--[[ Configure Typescript Lsp ]] --
require("lspconfig").ts_ls.setup({
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
