--[[ Map `vim` keyword ]]--
local vim = vim

--[[ rustaceanvim configuration ]]--
vim.g.rustaceanvim = {
	-- Plugin configuration
	tools = {
	},
	-- LSP configuration
	server = {
		on_attach = function(client, bufnr)

			local opts = {buffer = bufnr}
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
			vim.keymap.set('n', '<space>wl', function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover,opts)
			vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, opts)
			vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
			vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)

			-- you can also put keymaps in here
		end,
		default_settings = {
			-- rust-analyzer language server configuration
			['rust-analyzer'] = {
				-- enable clippy on save
				checkOnSave = true,
				--[[
				rustfmt = {
					extraArgs = {
						[1] = "--config hard_tabs=true",
					},
				},
				]]--
				check = {
					command = "clippy",
				},
				hover = {
					actions = {
						enable = true,
					},
					memoryLayout = {
						enable = true,
					},
				},
				diagnostics = {
					disabled = {
						[1] = 'unresolved-proc-macro';
					}
				},
			},
		},
	},
	-- DAP configuration
	dap = {
	},
}
