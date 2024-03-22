
local function on_attach(client, buffer)
	-- This callback is called when the LSP is atttached/enabled for this buffer
	-- we could set keymaps related to LSP, etc here.

	local opts = {buffer = buffer}
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
end

-- Configure LSP through rust-tools.nvim plugin.
-- rust-tools will configure and enable certain LSP features for us.
-- See https://github.com/simrat39/rust-tools.nvim#configuration
local opts = {
	tools = {
		runnables = {
			use_telescope = true,
		},
		inlay_hints = {
			auto = false,
			show_parameter_hints = false,
			parameter_hints_prefix = "",
			other_hints_prefix = "",
		},
		-- options same as lsp hover / vim.lsp.util.open_floating_preview()
		hover_actions = {

			-- the border that is used for the hover window
			-- see vim.api.nvim_open_win()
			border = {
				{ "╭", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╮", "FloatBorder" },
				{ "│", "FloatBorder" },
				{ "╯", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╰", "FloatBorder" },
				{ "│", "FloatBorder" },
			},

			-- Maximal width of the hover window. Nil means no max.
			max_width = nil,

			-- Maximal height of the hover window. Nil means no max.
			max_height = nil,

			-- whether the hover action window gets automatically focused
			-- default: false
			auto_focus = false,
		},
	},

	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
	server = {
		-- on_attach is a callback called when the language server attachs to the buffer
		on_attach = on_attach,
		settings = {
		-- to enable rust-analyzer settings visit:
		-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
			["rust-analyzer"] = {
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
}
require("rust-tools").setup(opts)
