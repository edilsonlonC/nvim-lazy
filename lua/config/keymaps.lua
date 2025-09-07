-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<Leader>vs", ":vsplit<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>hs", ":split<CR>", { silent = true, noremap = true })
-- f" → siguiente comilla
vim.api.nvim_set_keymap("n", "<leader>f", 'f"', { silent = true, noremap = true })

-- F" → comilla anterior
vim.api.nvim_set_keymap("n", "<leader>F", 'F"', { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>di", 'di"', { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>yi", 'yi"', { silent = true, noremap = true })
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
-- Debugging
keymap.set("n", "<leader>du", "<cmd>lua require('dapui').toggle()<cr>")
keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
keymap.set("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>")
keymap.set("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>")
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
keymap.set("n", "<leader>dd", function()
  require("dap").disconnect()
  require("dapui").close()
end)
keymap.set("n", "<leader>dt", function()
  require("dap").terminate()
  require("dapui").close()
end)
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
keymap.set("n", "<leader>di", function()
  require("dap.ui.widgets").hover()
end)
keymap.set("n", "<leader>d?", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end)
keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>")
keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>")
keymap.set("n", "<leader>de", function()
  require("telescope.builtin").diagnostics({ default_text = ":E:" })
end)

-- jdtls keymaps
--
keymap.set("n", "<leader>j", "<cmd>lua require('jdtls').extract_variable()<cr>")
-- Code Action en modo normal
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })

-- Code Action en modo visual (para extract variable/method seleccionados)
vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action (Visual)" })
