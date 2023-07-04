local builtin = require("telescope.builtin")

local set = vim.keymap.set

-- telescope.nvim
set("n", "<leader>ff", builtin.find_files)
set("n", "<leader>fb", builtin.buffers)
set("n", "<leader>fg", builtin.live_grep)
