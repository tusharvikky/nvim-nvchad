# Neovim Keymaps Documentation

Complete reference guide for all keybindings in this NvChad configuration.

## Table of Contents

1. [Custom Keymaps](#custom-keymaps)
2. [Debugging Keymaps (DAP)](#debugging-keymaps-dap)
3. [Python Debugging](#python-debugging)
4. [OpenCode AI Assistant](#opencode-ai-assistant)
5. [NvChad Default Keymaps](#nvchad-default-keymaps)

---

## Custom Keymaps

Custom keybindings defined in `lua/mappings.lua`:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `;` | Normal | `:` | Enter command mode |
| `jk` | Insert | `<ESC>` | Exit insert mode |

---

## Debugging Keymaps (DAP)

Universal debugging keybindings available in `lua/configs/dap.lua` for all supported languages (Python, JavaScript, TypeScript, Vue.js, Angular).

### Breakpoint & Session Control

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Space>db` | Normal | Toggle Breakpoint | Set/unset breakpoint at current line |
| `<Space>dc` | Normal | Start/Continue Debugging | Start debug session or resume execution |
| `<Space>dt` | Normal | Terminate Debug Session | Stop the debugger and end session |
| `<Space>dr` | Normal | Reset Debug UI | Reinitialize the debug UI panel |

### Step Controls (Function Keys)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `F5` | Normal | Continue | Resume execution from breakpoint |
| `F10` | Normal | Step Over | Execute next line without stepping into functions |
| `F11` | Normal | Step Into | Step into function calls |
| `F12` | Normal | Step Out | Execute until current function returns |

---

## Python Debugging

Python-specific debugging keybindings in `lua/configs/dap-python.lua`:

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Space>dpr` | Normal | Debug Test Method | Debug the current test method (pytest) |
| `<Space>dpc` | Normal | Debug Test Class | Debug the current test class (pytest) |
| `<Space>ds` | Visual | Debug Selection | Debug selected code in Python REPL |

### Python Commands

| Command | Description |
|---------|-------------|
| `:DapPythonPath` | Display the Python interpreter path used by DAP |

---

## OpenCode AI Assistant

OpenCode keybindings configured in `lua/configs/opencode.lua` for AI-powered code assistance:

### Core OpenCode Commands

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-a>` | Normal/Visual | Ask OpenCode | Ask AI assistant with code context |
| `<C-x>` | Normal/Visual | Execute Action | Execute suggested code action from OpenCode |
| `ga` | Normal/Visual | Add to Prompt | Add selected code to OpenCode prompt |
| `<C-.>` | Normal/Terminal | Toggle OpenCode | Toggle OpenCode window on/off |

### OpenCode Navigation

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<S-C-u>` | Normal | Half Page Up | Scroll OpenCode session up by half page |
| `<S-C-d>` | Normal | Half Page Down | Scroll OpenCode session down by half page |

### OpenCode Aliases

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `+` | Normal | Increment | Alias for `<C-a>` (Ask OpenCode) |
| `-` | Normal | Decrement | Alias for `<C-x>` (Execute Action) |

---

## NvChad Default Keymaps

This configuration extends NvChad v2.5 with its default keybindings. Below are commonly used NvChad keymaps:

### Navigation

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-h>` | Normal | Left | Move to left window |
| `<C-j>` | Normal | Down | Move to down window |
| `<C-k>` | Normal | Up | Move to up window |
| `<C-l>` | Normal | Right | Move to right window |

### Buffer Management

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-b>` | Normal | Toggle NeoTree | Open/close file explorer |
| `<leader>x` | Normal | Close Buffer | Close current buffer |
| `<leader>b` | Normal | Buffer List | Show buffer list (Telescope) |

### Search & Find

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>ff` | Normal | Find Files | Search files with Telescope |
| `<leader>fw` | Normal | Find Word | Search word under cursor |
| `<leader>fa` | Normal | Find All | Search all files for pattern |
| `<C-/>` | Normal | Toggle Comments | Comment/uncomment current line |

### Terminal

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<C-t>` | Normal | Toggle Terminal | Open/close floating terminal |
| `<leader>h` | Normal | Terminal (Horizontal) | Open terminal in horizontal split |
| `<leader>v` | Normal | Terminal (Vertical) | Open terminal in vertical split |

### LSP (Language Server Protocol)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gd` | Normal | Go to Definition | Jump to definition |
| `gr` | Normal | Go to References | Find all references |
| `gI` | Normal | Go to Implementation | Jump to implementation |
| `<leader>ca` | Normal | Code Action | Show code actions |
| `<leader>rn` | Normal | Rename | Rename symbol |
| `<leader>D` | Normal | Type Definition | Show type definition |

### Other Useful Keymaps

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>/` | Normal | Toggle Todos | Show/hide todo comments |
| `<leader>?` | Normal | Help | Show help menu |
| `<leader>n` | Normal | New File | Create new file |
| `<leader>w` | Normal | Save | Save current file |

---

## Workflow Tips

### Debugging Python with Tests

```
1. Set breakpoint: <Space>db
2. Run test method: <Space>dpr
3. Step through: F10 (step over) or F11 (step into)
4. Continue: F5
5. Terminate: <Space>dt
```

### Debugging Vue.js/Angular

```
1. Start dev server: npm run dev
2. Set breakpoint: <Space>db
3. Continue: <Space>dc
4. Select browser/debugger option when prompted
5. Step with F10/F11, continue with F5
```

### Using OpenCode with Debugging

```
1. Stop at breakpoint: <Space>db
2. Ask OpenCode for help: <C-a>
3. Execute suggested action: <C-x>
4. Continue debugging: F5
```

---

## Configuration Files

- **Custom Mappings:** `lua/mappings.lua`
- **DAP Debugging:** `lua/configs/dap.lua`
- **Python DAP:** `lua/configs/dap-python.lua`
- **OpenCode AI:** `lua/configs/opencode.lua`
- **LSP Config:** `lua/configs/lspconfig.lua`

For more information on NvChad default keymaps, visit: https://nvchad.com/

---

## Notes

- `<Space>` refers to the space bar (leader key)
- `<C-x>` means `Ctrl+x`
- `<S-x>` means `Shift+x`
- `<leader>` is typically mapped to space in this configuration
- All keymaps shown use `n` (Normal), `i` (Insert), `v` (Visual), `x` (Visual), or `t` (Terminal) modes

