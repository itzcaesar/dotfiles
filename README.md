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
| Bar/Sidebar | skwd-shell |
| Wallpaper | skwd-wall |
| Color gen | matugen |
| Fetch | fastfetch |
| Notifications | Dunst |
| GTK/QT | adw-gtk3 / qt6ct |
| Spotify theme | Spicetify |

## Dynamic theming

Colors are generated from your wallpaper using **matugen** (Material You). [skwd-wall](https://github.com/itzcaesar/skwd-wall) automates this — every wallpaper change triggers color regeneration for:

- **Hyprland** — borders, shadow
- **Kitty** — terminal colors
- **Rofi** — background, foreground, selection
- **Spicetify** — Spotify theme
- **Yazi** — file manager theme
- **Vesktop** — Discord theme
- **skwd-shell** — bar and sidebar widgets

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

## fastfetch

```
                  
                  athylus@arch
      /\           OS  Arch Linux x86_64
     /  \         󰌢 Host  83JC (LOQ 15ARP9)
    /    \         Kernel  Linux 7.0.11-arch1-1
   /      \        Uptime  26 mins
  /   ,,   \      󰏖 Packages  714 (pacman)
 /   |  |   \      Shell  bash 5.3.12
/_-''    ''-_\     WM  Hyprland 0.55.3 (Wayland)
                   Terminal  opencode
                  
                  
```
