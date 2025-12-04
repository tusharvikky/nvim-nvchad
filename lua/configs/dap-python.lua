local dap_python = require "dap-python"

-- Function to get the Python path from active conda environment
local function get_python_path()
  -- Check if CONDA_PREFIX is set (conda environment is active)
  local conda_prefix = vim.fn.getenv "CONDA_PREFIX"
  if conda_prefix ~= vim.NIL and conda_prefix ~= "" then
    return conda_prefix .. "/bin/python"
  end

  -- Fallback to system python3
  return "python3"
end

-- Setup Python debugging with conda environment
dap_python.setup(get_python_path())

-- Python-specific keymaps
vim.keymap.set("n", "<leader>dpr", function()
  dap_python.test_method()
end, { desc = "Debug Python Test Method" })

vim.keymap.set("n", "<leader>dpc", function()
  dap_python.test_class()
end, { desc = "Debug Python Test Class" })

vim.keymap.set("v", "<leader>ds", function()
  dap_python.debug_selection()
end, { desc = "Debug Python Selection" })

-- Command to check which Python is being used
vim.api.nvim_create_user_command("DapPythonPath", function()
  print("DAP Python path: " .. get_python_path())
end, { desc = "Show Python path used by DAP" })
