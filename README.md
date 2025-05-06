#  Neovim Configuration 

## 🚀  Features
* **Plugin Management:** Efficient handling of plugins using `lazy`.
* **Language Support:** `Language Server Protocol` (LSP) configurations for enhanced code intelligence.
* **Syntax Highlighting:** Syntax highlighting powered by `treesitter`.
* **User Interface:** A clean and informative `status line`, `file tree`, and `buffer line` setup.
* **Built-In Terminal:** Easily access a terminal using `Ctrl+\` while in `normal` mode.

## 🛠️  Installation
### Prerequisites
* **Neovim:** Ensure you have Neovim version 0.9 or higher installed.
* **Git:** Required for cloning the repository and managing plugins.
> **Note:** This guide assumes you are using Linux or macOS. If you are using Windows, I'd recommend installing WSL2. 

### Steps
1. Backup Existing Configuration (If Exists):
```sh
mv ~/.config/nvim ~/.config/nvim.bak
```

2. Clone This Repository:
```sh
git clone https://github.com/Calastian/neovim.git ~/.config/nvim
```

3. Launch Neovim:
```sh
nvim
```

## 🔧  Keybinds
| Mode     | Keybinding   | Action                      |
|----------|--------------|-----------------------------|
| `normal` | `<leader>ff` | Finds files using Telescope |
| `normal` | `<leader>fg` | Live grep search            |
| `normal` | `<leader>q`  | Closes the current buffer   |
| `normal` | `<C-n>`      | Toggles file explorer       | 


## 🤝  Contributing
Contributions are welcome! If you have suggestions or improvements, feel free to open an issue or submit a pull request.
## 📄  License
This project is licensed under the MIT License. 
## 📬  Contact
For questions or feedback, feel free to reach out to me at [christiannovgrod.dev@gmail.com]

