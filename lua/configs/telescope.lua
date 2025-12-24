local telescope = require "telescope"
local actions = require "telescope.actions"
local builtin = require "telescope.builtin"

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      "^.git/",
      "^node_modules/",
      "^__pycache__/",
      "^%.git/",
      "^%.venv/",
      "^venv/",
      "^env/",
      "^dist/",
      "^build/",
      "^%.env",
      "^%.pytest_cache/",
      "^%.mypy_cache/",
    },
    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = false,
    },
  },
}

return {}
