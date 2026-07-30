# nvim-parrot

My NvChad config. `lazy-lock.json` pins exact plugin versions, so a fresh clone reproduces this setup exactly.

## Requirements

- **Neovim 0.11+** (this config is tested on v0.12.4 — check with `nvim --version`)
- `git`
- A C compiler (`gcc`/`clang`) and `make` — needed to build Treesitter parsers
- [`tree-sitter-cli`](https://github.com/tree-sitter/tree-sitter) — needed by nvim-treesitter
- [`ripgrep`](https://github.com/BurntSushi/ripgrep) — needed for Telescope's live grep
- A [Nerd Font](https://www.nerdfonts.com/) installed and selected in your terminal — needed for icons to render (this setup uses JetBrainsMono Nerd Font)

On Debian/Ubuntu/Parrot:
```bash
sudo apt install tree-sitter-cli ripgrep
```

## Install

1. Back up and remove any existing Neovim config/data:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
   mv ~/.local/share/nvim ~/.local/share/nvim.bak 2>/dev/null
   mv ~/.local/state/nvim ~/.local/state/nvim.bak 2>/dev/null
   mv ~/.cache/nvim ~/.cache/nvim.bak 2>/dev/null
   ```

2. Clone this repo into place:
   ```bash
   git clone https://github.com/thechinamin/nvim-parrot ~/.config/nvim
   ```

3. Launch Neovim. On first run, `lazy.nvim` bootstraps itself and installs all plugins automatically:
   ```bash
   nvim
   ```

4. Once plugins finish installing, install the default Treesitter parsers:
   ```vim
   :TSInstallAll
   ```

5. Install language servers as needed for whatever you're working on:
   ```vim
   :MasonInstall <server-name>
   ```
   (e.g. `pyright`, `lua-language-server`, `bashls`). Browse available tools with `:Mason`.

6. Run `:checkhealth` to confirm everything is set up correctly.

## Updating plugins

```vim
:Lazy sync
```
