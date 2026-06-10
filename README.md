# dotfiles — Arch Linux + Hyprland

Minimal, dynamic rice with Material You colors generated from your wallpaper.

## Stack

| Component | Choice |
|-----------|--------|
| WM | Hyprland (Lua config) |
| Shell | bash |
| Terminal | Kitty |
| Launcher | Rofi |
| File manager | Yazi + Dolphin |
| Wallpaper | skwd-wall |
| Color gen | matugen |
| Fetch | fastfetch |
| GTK/QT | adw-gtk3 / qt6ct |
| Spotify theme | Spicetify |

## Dynamic theming

Colors are generated from your wallpaper using **matugen** (Material You). [skwd-wall](https://github.com/itzcaesar/skwd-wall) automates this — every wallpaper change triggers color regeneration for:

- **Hyprland** — borders, shadow
- **Kitty** — terminal colors
- **Rofi** — background, foreground, selection
- **Neovim** — NvChad base46 theme (auto-reloads on change)
- **Spicetify** — Spotify theme
- **Yazi** — file manager theme

## Install (fresh Arch)

```bash
git clone --separate-git-dir="$HOME/.git" https://github.com/itzcaesar/dotfiles.git ~
git checkout main
./install.sh
```

The script installs all packages (official + AUR), enables services, and generates initial colors from your wallpaper.

## Regenerate colors manually

```bash
matugen-wall
```

Or via skwd-wall's Matugen settings (EXTERNAL MATUGEN → Command) which runs automatically on wallpaper change.
