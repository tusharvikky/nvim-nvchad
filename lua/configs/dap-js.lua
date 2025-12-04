local dap = require "dap"
local dap_vscode_js = require "dap-vscode-js"

-- Get the path to vscode-js-debug
local mason_registry_ok, mason_registry = pcall(require, "mason-registry")
local js_debug_path = vim.fn.stdpath "data" .. "/lazy/vscode-js-debug"

-- Setup vscode-js-debug adapter
dap_vscode_js.setup {
  debugger_path = js_debug_path,
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
}

-- Configure for JavaScript, TypeScript, Vue.js, Angular
for _, language in ipairs { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" } do
  dap.configurations[language] = {
    -- Debug web app in Chrome
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Launch Chrome (Vue/Angular)",
      url = "http://localhost:8080", -- Change port as needed
      webRoot = "${workspaceFolder}",
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
    -- Debug Node.js app
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Node.js",
      program = "${file}",
      cwd = "${workspaceFolder}",
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
    -- Attach to running Node.js process
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to Node.js",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
      sourceMaps = true,
      protocol = "inspector",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
    -- Debug Vite dev server (Vue.js)
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Launch Vite (Vue.js)",
      url = "http://localhost:5173", -- Vite default port
      webRoot = "${workspaceFolder}/src",
      sourceMaps = true,
      protocol = "inspector",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
    -- Debug Angular dev server
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Launch Angular",
      url = "http://localhost:4200", -- Angular default port
      webRoot = "${workspaceFolder}",
      sourceMaps = true,
      protocol = "inspector",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
  }
end

-- JavaScript/TypeScript specific keymaps
vim.keymap.set("n", "<leader>djc", function()
  -- Select configuration
  require("dap").continue()
end, { desc = "Debug JS: Start/Continue" })
