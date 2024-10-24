local keymap = vim.api.nvim_set_keymap

-- Leader Key --
vim.g.mapleader = " "

-- Tab
keymap("n", "<leader>tn", ":tabnew<CR>", { noremap = true, silent = true })
keymap("n", "<leader>tt", ":tabclose<CR>", { noremap = true, silent = true })

-- Nvim-bufferline
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
keymap("n", "<leader><Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

-- Mason.nvim LSP manager
-- keymap('n', '<leader>li', ':LspInstall<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>lu', ':LspUninstall<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>ll', ':LspList<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>ls', ':LspStart<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>lq', ':LspStop<CR>', { noremap = true, silent = true })

-- Nvim-tree.lua
keymap("n", "<leader>nn", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
keymap("n", "<leader>nr", ":NvimTreeRefresh<CR>", { noremap = true, silent = true })
keymap("n", "<leader>nf", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
keymap("n", "<leader>nb", ":NvimTreeFocus<CR>", { noremap = true, silent = true })

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })
keymap("n", "<leader>fb", ":Telescope file_browser<CR>", { noremap = true, silent = true })
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true, silent = true })

-- Noice.nvim
keymap("n", "<leader>ns", ":NoiceTelescope<CR>", { noremap = true, silent = true })

-- LSP
keymap("n", "<leader>dd", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>df", ":lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
