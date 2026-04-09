# Auto Setup

A collection of modular shell scripts for automatic computer environment setup for KimMinwoo.
This project automates the installation of essential tools, ROS 2, Miniconda, and a professional Neovim setup (LunarVim).

## Features
- Base Utilities: git, wget, curl, build-essential, xclip, etc.

- Shell: Zsh with Oh My Zsh, af-magic theme, and essential plugins.

- Editor: Neovim 0.10.2 & LunarVim (IDE-like experience).

- Languages: Python (via Miniconda), Node.js (via n), Rust (via Cargo).

- ROS 2: ROS 2 Humble setup with colcon and helpful aliases.

- Development Tools: Chrome, VSCode, LazyGit, and C++ libraries.

- Fonts: Automatic installation of JetBrainsMono Nerd Font.

---

## (Important) Pre-requirements
Before running the scripts, ensure you have the basic tools installed to clone and execute the setup:

```bash

sudo apt-get update && sudo apt-get install -y curl git wget lsb-release
```

How to Use
### 1. Clone the repository
``` bash
git clone https://github.com/KimMinwoo1214/Auto_Setup.git
cd Auto_Setup
```

### 2. Grant execution permissions
```bash
chmod +x *.sh
```

### 3. Run the master setup
You can run all scripts at once using the master script:

```bash
./setup.sh
```
Note: The master script automatically finds and runs all .sh files in the current directory.

## Post-Installation (Critical)

### 1. Apply Zsh Settings
After the script finishes, restart your terminal or run:

```zsh
source ~/.zshrc
```

### 2. Terminal Font (For Icons)
To see the icons in LunarVim and the Zsh theme correctly, you must use a Nerd Font.

The script install_lvim_font.sh automatically installs the font and configures Terminator settings.

If you use a different terminal, manually set the font to "JetBrainsMono Nerd Font Mono".

### 3. Check LunarVim
Run lvim to start the editor. On the first run, it will automatically install additional plugins.

Included Scripts
- all_install.sh: The master script that executes all modular scripts.

- install_zsh.sh & install_zsh_theme.sh: Zsh environment and Oh My Zsh configuration.

- install_lunarvim.sh: Neovim 0.10.2, Node.js, Rust, and LunarVim installation.

- install_ros2-humble.sh: ROS 2 Humble installation and setup.

- install_miniconda.sh: Miniconda installation for Python environment management.

- install_lvim_font.sh: JetBrainsMono Nerd Font installation and Terminator setup.

- install_vscode.sh & install_chrome.sh: Essential GUI application installation.

- install_custom_config.sh: User-specific aliases and environment paths.

- install_lazygit.sh & install_yadm_install.sh: Additional CLI tools for Git and dotfiles.

Customization
You can modify your aliases and environment variables in install_custom_config.sh before running the setup to match your personal workflow.

**[LazyGit Keybinding](https://github.com/jesseduffield/lazygit/blob/master/docs/keybindings/Keybindings_ko.md)**
