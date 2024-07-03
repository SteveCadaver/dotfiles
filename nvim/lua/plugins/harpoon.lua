local harpoon = require("harpoon")
local api = vim.api

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>r", function() harpoon:list():remove() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

local function get_tabpage_name(tabpage_id)
	-- Get the buffer handle for the active window in the tabpage
	local active_win_id = api.nvim_tabpage_get_win(tabpage_id)
	-- Get the buffer id assosiated with the active window
	local buf_id = api.nvim_win_get_buf(active_win_id)
	-- Retrieve buffer name assosiated with the tabpage
	return api.nvim_buf_get_name(buf_id)
end

local function list_contains(list, substring)
	for _, element in ipairs(list) do
		local absoluteFilePath = get_tabpage_name(element)
		if string.find(absoluteFilePath, substring) then
			return true
		end
	end
	return false
end

---
-- Opens each file in a new tab. First checks is the files are open in other tabs before opening the new tab.
local function open_files(list)
	-- list of currently open tabs to search
	local lookup = api.nvim_list_tabpages()

	for _, item in ipairs(list.items) do
		if (item.value ~= nil and item.value ~= '' and not list_contains(lookup, item.value)) then
			-- Execute 'tabedit' command to create a new tab page
			api.nvim_command("tabe " .. item.value)
		end
	end
end

vim.keymap.set("n", "<C-t>", function() open_files(harpoon:list()) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
