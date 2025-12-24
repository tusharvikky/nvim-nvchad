# NvChad Custom Configuration

A feature-rich Neovim configuration based on [NvChad v2.5](https://github.com/NvChad/NvChad) with multi-language debugging support and AI assistant integration.

## ✨ Features

- 🐍 **Python** debugging with conda environment support
- 🎨 **Vue.js** debugging with Vite dev server
- 🅰️ **Angular** debugging with ng serve
- 🤖 **AI Assistant** integration via opencode.nvim
- 📝 **LSP** support for HTML, CSS, and more
- 🎯 **Code formatting** with conform.nvim

## 📦 Prerequisites

Before installing, ensure you have:

- **Neovim** >= 0.10.0
- **Git**
- **Node.js** >= 18.x and npm (for JavaScript debugging)
- **Python 3** (for Python debugging)
- **Conda** (optional, for Python environment management)
- A [Nerd Font](https://www.nerdfonts.com/) installed and set in your terminal

## 🚀 Installation

### 1. Backup Existing Config (if any)

```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.local/state/nvim ~/.local/state/nvim.backup
```

### 2. Clone This Repository

```bash
git clone https://github.com/tusharvikky/nvim-nvchad ~/.config/nvim
cd ~/.config/nvim
rm -rf .git  # Optional: remove git history to make it your own
```

### 3. Install Plugins

Open Neovim and plugins will auto-install:

```bash
nvim
```

Wait for lazy.nvim to install all plugins. You may see some errors on first launch - this is normal.

### 4. Sync Plugins

Once Neovim opens, run:

```vim
:Lazy sync
```

This will install and build all debug adapters.

## 🔧 Language-Specific Setup

### Python Debugging

#### Install debugpy in your conda environments:

```bash
# Activate your project environment
conda activate myproject

# Install debugpy
pip install debugpy
```

#### Verify setup:

```vim
:DapPythonPath
```

This shows which Python interpreter DAP will use.

### JavaScript/TypeScript/Vue.js/Angular Debugging

The JavaScript debug adapter builds automatically during `:Lazy sync`. No additional setup needed if you have Node.js installed.

#### For Vue.js projects:

Ensure source maps are enabled in `vite.config.js`:

```javascript
export default {
  build: {
    sourcemap: true
  }
}
```

#### For Angular projects:

Source maps are enabled by default in development mode.

### OpenCode AI Assistant (Optional)

#### Install the opencode CLI:

**macOS:**
```bash
brew install opencode
```

**Windows:**
```bash
winget install -e --id SST.opencode
```

**npm:**
```bash
npm i -g opencode-ai@latest
```

**Quick install script:**
```bash
curl -fsSL https://opencode.ai/install | bash
```

#### Verify installation:

```bash
opencode --version
```

## 🎮 Debugging Keybindings

### Universal (All Languages)

| Key | Action |
|-----|--------|
| `<Space>db` | Toggle breakpoint |
| `<Space>dc` | Start/Continue debugging |
| `<Space>dt` | Terminate debug session |
| `<Space>du` | Toggle debug UI |
| `<Space>de` | Evaluate expression |
| `<Space>dr` | Reset debug UI |
| `F5` | Continue |
| `F10` | Step over |
| `F11` | Step into |
| `F12` | Step out |

### Python-Specific

| Key | Action |
|-----|--------|
| `<Space>dpr` | Debug test method |
| `<Space>dpc` | Debug test class |
| `<Space>ds` | Debug selection (visual mode) |

## 🤖 OpenCode AI Assistant Keybindings

| Key | Mode | Action |
|-----|------|--------|
| `<C-a>` | Normal/Visual | Ask opencode with context |
| `<C-x>` | Normal/Visual | Execute opencode action |
| `ga` | Normal/Visual | Add to opencode prompt |
| `<C-.>` | Normal/Terminal | Toggle opencode window |
| `+` | Normal | Increment (remapped) |
| `-` | Normal | Decrement (remapped) |

## 📝 Common Workflows

### Debugging Python

```bash
# 1. Activate conda environment
conda activate myproject

# 2. Open Neovim
nvim my_script.py

# 3. Set breakpoints with <Space>db
# 4. Start debugging with <Space>dc
# 5. Step through with F10/F11
```

### Debugging Vue.js

```bash
# 1. Start dev server
npm run dev

# 2. Open Neovim
nvim src/App.vue

# 3. Set breakpoints with <Space>db
# 4. Start debugging with <Space>dc
# 5. Select "Launch Vite (Vue.js)"
```

## 🗂️ Project Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── autocmds.lua        # Auto commands
│   ├── chadrc.lua          # NvChad configuration
│   ├── mappings.lua        # Custom keymaps
│   ├── options.lua         # Vim options
│   ├── configs/            # Plugin configurations
│   │   ├── conform.lua     # Code formatter
│   │   ├── lspconfig.lua   # LSP servers
│   │   ├── lazy.lua        # Lazy.nvim settings
│   │   ├── opencode.lua    # OpenCode AI config
│   │   ├── dap.lua         # Core DAP configuration
│   │   ├── dap-ui.lua      # Debug UI
│   │   ├── dap-python.lua  # Python debugging
│   │   └── dap-js.lua      # JS/TS/Vue/Angular
│   └── plugins/
│       └── init.lua        # Plugin definitions
├── lazy-lock.json          # Plugin versions
└── .stylua.toml           # Lua formatter config
```

## 🔍 Troubleshooting

### Plugins not installing

```vim
:Lazy clean
:Lazy sync
```

### Python debugger not working

1. Check Python path: `:DapPythonPath`
2. Ensure debugpy is installed: `pip list | grep debugpy`
3. Verify conda environment is active: `echo $CONDA_PREFIX`

### JavaScript debugger not building

```bash
# Manually rebuild
cd ~/.local/share/nvim/lazy/vscode-js-debug
npm install --legacy-peer-deps
npx gulp vsDebugServerBundle
mv dist out
```

### OpenCode keybindings not working

1. Install opencode CLI: `brew install opencode`
2. Verify installation: `opencode --version`
3. Restart Neovim

## 📚 Additional Resources

- [NvChad Documentation](https://nvchad.com/)
- [nvim-dap Documentation](https://github.com/mfussenegger/nvim-dap)
- [OpenCode Documentation](https://opencode.ai/docs)
- [Debugging Guide](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation)

## 🙏 Credits

- [NvChad](https://github.com/NvChad/NvChad) - Base configuration
- [LazyVim Starter](https://github.com/LazyVim/starter) - Inspiration for structure
- All plugin authors and contributors

## 📄 License

This configuration is provided as-is. Feel free to use and modify as needed.
