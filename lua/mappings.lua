require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle breakpoint" })
map("n", "<leader>dc", "<cmd> DapContinue <CR>", { desc = "Start/Continue debugging" })
map("n", "<leader>dk", function()
  require("dapui").toggle {}
  require("dap").terminate()
end, { desc = "Kill" })
map("n", "<leader>dso", function()
  require("dap").step_over()
end, { desc = "Step over" })
map("n", "<leader>dsi", function()
  require("dap").step_into()
end, { desc = "Step into" })
map("n", "<leader>dsx", function()
  require("dap").step_out()
end, { desc = "Step out" })
map("n", "<leader>dt", function()
  require("dap-python").test_method()
end, { desc = "Debug test method" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
