# Neovim Configuration

A ready-to-use Neovim configuration focused on simplicity and quality-of-life features.



## Features

- Plugin management with `lazy.nvim`
- LSP support for multiple languages
- Autocompletion
- Treesitter syntax highlighting
- Autoformatting for multiple languages (not limited to Prettier)
- Autopairs and tag completion
- Git integration via `gitsigns`
- Fuzzy finding with Telescope
- File explorer with Neo-tree
- Statusline and bufferline
- Autosave functionality
- LSP diagnostics for syntax and runtime errors 
- Custom keymaps and editor behavior

## Requirements

- Neovim >= 0.10
- Git
- A Nerd Font (Recommended for icons)
- `ripgrep` (for Telescope search)
- `fd` (optional but recommended)

## Installation

Backup your existing config first (if needed):

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

Then clone the repository:

```bash
git clone https://github.com/BitFlowCodex/nvim-config.git ~/.config/nvim 
``` 

Start Neovim:

```bash
nvim
```

## Structure

```text
├── init.lua
├── lazy-lock.json
├── LICENSE
├── lua
│   ├── core
│   │   ├── keymaps.lua
│   │   └── options.lua
│   └── plugins
│       ├── autocompletion.lua
│       ├── autoformatting.lua
│       ├── autopairs.lua
│       ├── autosave.lua
│       ├── autotag.lua
│       ├── bufferline.lua
│       ├── colortheme.lua
│       ├── gitsigns.lua
│       ├── lsp.lua
│       ├── lualine.lua
│       ├── menuscreen.lua
│       ├── neotree.lua
│       ├── telescope.lua
│       └── treesitter.lua
```
