local keymap = vim.keymap

-- Insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Insert mode: Exit insert mode" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Window  management: Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Window management: Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Window management: Make splits equal size" })
keymap.set("n", "<leader>sx", "<CMD>close<CR>", { desc = "Window management: Close current split" })

-- Tab management
keymap.set("n", "<leader>to", "<CMD>tabnew<CR>", { desc = "Tab management: Open new tab" })
keymap.set("n", "<leader>tx", "<CMD>tabclose<CR>", { desc = "Tab management: Close current tab" })
keymap.set("n", "<leader>tn", "<CMD>tabn<CR>", { desc = "Tab management: Go to next tab" })
keymap.set("n", "<leader>tp", "<CMD>tabp<CR>", { desc = "Tab management: Go to previsou tab" })
keymap.set("n", "<leader>tf", "<CMD>tabnew %<CR>", { desc = "Tab management: Open current buffer in new tab" })
