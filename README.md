<p align="center">
  <img src="https://archlinux.org/static/logos/arch-linux-logo-600-271cdfae893e113a8b98e942e7ce6848.png" width="64"><br>
  <b>dotfiles — Arch + Hyprland</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/OS-Arch_Linux-1793D1?logo=arch-linux&logoColor=white">
  <img src="https://img.shields.io/badge/WM-Hyprland-8A2BE2?logo=hyprland&logoColor=white">
  <img src="https://img.shields.io/badge/Shell-bash-4EAA25?logo=gnu-bash&logoColor=white">
  <br>
  <img src="https://img.shields.io/badge/Terminal-Kitty-000000?logo=kitty&logoColor=white">
  <img src="https://img.shields.io/badge/Editor-Neovim-57A143?logo=neovim&logoColor=white">
  <img src="https://img.shields.io/badge/Launcher-Rofi-18181B">
</p>

<p align="center">
  <b>Minimal, dynamic rice with <a href="https://material-foundation.github.io/material-you/">Material You</a> colors<br>
  generated from your wallpaper.</b>
</p>

---

## Stack

| Component | Choice |
|-----------|--------|
| WM | Hyprland (Lua config) |
| Shell | bash |
| Terminal | Kitty |
| Launcher | Rofi |
| File manager | Yazi + Dolphin |
| Wallpaper | [skwd-wall](https://github.com/itzcaesar/skwd-wall) |
| Color gen | matugen |
| Fetch | fastfetch |
| GTK/QT | adw-gtk3 / qt6ct |
| Spotify | Spicetify |

## Dynamic theming

Every wallpaper change triggers color regeneration for all visible surfaces:

| App | What changes |
|-----|-------------|
| **Hyprland** | Window borders, shadows |
| **Kitty** | Terminal 16-color palette |
| **Rofi** | Background, foreground, selection states |
| **Neovim** | NvChad base46 theme (auto-reloads) |
| **Spicetify** | Spotify theme |
| **Yazi** | File manager selection, hover, directory icons |

## Getting started

### Fresh install

```bash
git clone --separate-git-dir="$HOME/.git" https://github.com/itzcaesar/dotfiles.git ~
git checkout main
./install.sh
```

The script installs all packages (official + AUR), enables services, and generates initial colors from your wallpaper.

### Manual color regeneration

```bash
matugen-wall
```

skwd-wall runs this automatically on every wallpaper change.

## Structure

```
.config/
├── hypr/          # Hyprland Lua config + dynamic colors
├── kitty/         # Terminal theme (skwd-theme.conf)
├── rofi/          # Launcher theme (colors.rasi)
├── nvim/          # NvChad base46 theme from wallpaper
├── yazi/          # File manager theme
├── spicetify/     # Spotify theme
├── fastfetch/     # System fetch config
├── gtk-3.0/       # GTK config
├── gtk-4.0/       # GTK config
├── qt5ct/         # Qt5 config
├── qt6ct/         # Qt6 config
├── skwd-wall/     # Wallpaper manager + matugen templates
└── matugen/       # Manual matugen config & templates
```

## License

MIT
