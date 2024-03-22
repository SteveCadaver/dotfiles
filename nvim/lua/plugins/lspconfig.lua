
--[[ Configure Lua Lsp - [lua_ls] ]]--
require("lspconfig").lua_ls.setup {
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					"vim"
				}
			}
		}
	}
}

--[[ Configure TailWindCSS Lsp ]]--
require("lspconfig").tailwindcss.setup{}

--[[ Configure Python Lsp ]]--
require("lspconfig").pylsp.setup{}
