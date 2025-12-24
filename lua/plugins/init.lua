return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- opencode.nvim - AI assistant integration
  {
    "NickvanDyke/opencode.nvim",
    cmd = { "Opencode", "OpencodePrompt" },
    keys = {
      { "<C-a>", mode = { "n", "x" } },
      { "<C-x>", mode = { "n", "x" } },
      { "ga", mode = { "n", "x" } },
      { "<C-.>", mode = { "n", "t" } },
    },
    dependencies = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `snacks` provider.
      {
        "folke/snacks.nvim",
        opts = {
          input = {},
          picker = {},
          terminal = {},
        },
      },
    },
    config = function()
      require "configs.opencode"
    end,
  },

  -- DAP (Debug Adapter Protocol) for debugging
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- UI for nvim-dap
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        config = function()
          require "configs.dap-ui"
        end,
      },
      -- Python adapter
      {
        "mfussenegger/nvim-dap-python",
        config = function()
          require "configs.dap-python"
        end,
      },
      -- JavaScript/TypeScript adapter (for Vue.js, Angular, React, Node.js)
      {
        "mxsdev/nvim-dap-vscode-js",
        dependencies = {
          -- Install and build vscode-js-debug adapter
          {
            "microsoft/vscode-js-debug",
            build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
          },
        },
        config = function()
          require "configs.dap-js"
        end,
      },
    },
    config = function()
      require "configs.dap"
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
