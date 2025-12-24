local dap = require "dap"

-- DAP signs (breakpoint indicators)
vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "🟡", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "🚫", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "📝", texthl = "DapLogPoint", linehl = "", numhl = "" })

-- Keymaps for debugging
local map = vim.keymap.set

map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Start/Continue Debugging" })
map("n", "<leader>dr", "<cmd>lua require('dapui').open({reset = true})<CR>", { desc = "Reset Debug UI" })
map("n", "<leader>dt", "<cmd>DapTerminate<CR>", { desc = "Terminate Debug Session" })

-- Step controls
map("n", "<F5>", "<cmd>DapContinue<CR>", { desc = "Debug: Continue" })
map("n", "<F10>", "<cmd>DapStepOver<CR>", { desc = "Debug: Step Over" })
map("n", "<F11>", "<cmd>DapStepInto<CR>", { desc = "Debug: Step Into" })
map("n", "<F12>", "<cmd>DapStepOut<CR>", { desc = "Debug: Step Out" })
