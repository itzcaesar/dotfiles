#!/usr/bin/env bash
set -euo pipefail

# ── Arch Linux fresh install — dotfiles bootstrap ──────────────
# Run from the dotfiles repo root (your $HOME after cloning)

info()  { printf "\033[1;34m[INFO]\033[0m %s\n" "$*"; }
ok()    { printf "\033[1;32m[ OK ]\033[0m %s\n" "$*"; }
err()   { printf "\033[1;31m[ERR ]\033[0m %s\n" "$*" >&2; exit 1; }

# ── 1. Official packages ───────────────────────────────────────
REPO_PKGS=(
    base base-devel linux linux-firmware
    amd-ucode
    btrfs-progs efibootmgr grub os-prober
    sudo nano vim wget git github-cli go make cmake unzip
    networkmanager network-manager-applet iwd
    pipewire pipewire-alsa pipewire-jack pipewire-pulse wireplumber libpulse
    bluez bluez-utils bluetui
    brightnessctl
    hyprland uwsm sddm polkit-gnome polkit-kde-agent xdg-desktop-portal-hyprland
    xdg-utils qt5-wayland qt6-wayland wl-clipboard grim slurp swappy
    rofi wofi
    kitty
    fastfetch
    yazi
    dunst
    dolphin
    nwg-look
    qt5ct qt6ct
    papirus-icon-theme
    noto-fonts noto-fonts-cjk noto-fonts-emoji
    ttf-dejavu ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-liberation
    btop
    ufw
    smartmontools
    wiremix
    power-profiles-daemon
    imagemagick
    zram-generator
    gst-plugin-pipewire
    libva-nvidia-driver nvidia-open
    spotify-launcher
    opencode
    fish
    neovim
    python python-pip
    nodejs npm
)

info "Installing official packages…"
sudo pacman -Syu --noconfirm --needed "${REPO_PKGS[@]}"
ok "Official packages installed"

# ── 2. AUR helper ──────────────────────────────────────────────
if ! command -v yay &>/dev/null; then
    info "Installing yay (AUR helper)…"
    BUILDDIR=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$BUILDDIR/yay"
    cd "$BUILDDIR/yay"
    makepkg -si --noconfirm
    cd "$OLDPWD"
    rm -rf "$BUILDDIR"
    ok "yay installed"
fi

# ── 3. AUR packages ────────────────────────────────────────────
AUR_PKGS=(
    matugen
    skwd-daemon-bin
    skwd-wall
    spicetify-cli
    vesktop-bin
    bibata-cursor-theme-bin
)

info "Installing AUR packages…"
yay -Syu --noconfirm --needed "${AUR_PKGS[@]}"
ok "AUR packages installed"

# ── 4. Services ────────────────────────────────────────────────
info "Enabling services…"
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth
sudo systemctl enable --now ufw
sudo systemctl enable --now fstrim.timer
sudo systemctl enable --now zram-generator
sudo systemctl enable sddm
ok "Services enabled"

# ── 5. Spicetify setup ────────────────────────────────────────
if command -v spicetify &>/dev/null; then
    info "Setting up spicetify…"
    spicetify backup
    sudo chmod a+wr /opt/spotify
    sudo chmod a+wr /opt/spotify/Apps -R
    spicetify apply
    ok "Spicetify ready"
fi

# ── 6. Matugen — generate colors from current wallpaper ───────
if command -v matugen &>/dev/null && command -v skwd &>/dev/null; then
    info "Generating theme colors from wallpaper…"
    WALL=$(skwd wall list 2>/dev/null | python3 -c \
        "import sys,json; d=json.load(sys.stdin); print(d['wallpapers'][0]['name'])" 2>/dev/null || true)
    if [[ -n "$WALL" ]]; then
        WALLPATH=$(find ~/Pictures/Wallpapers -name "$WALL" -type f 2>/dev/null | head -1)
        if [[ -n "$WALLPATH" ]]; then
            matugen image --prefer darkness -c ~/.config/matugen/config.toml "$WALLPATH" 2>/dev/null
            ok "Colors generated"
        fi
    fi
fi

# ── 7. Make matugen-wall script executable ─────────────────────
if [[ -f ~/.local/bin/matugen-wall ]]; then
    chmod +x ~/.local/bin/matugen-wall
    ok "matugen-wall script ready"
fi

# ── 8. Summary ─────────────────────────────────────────────────
printf "\n"
ok "Bootstrap complete!"
printf "\n"
info "Next steps:"
info "  1. Edit /etc/default/grub and run: sudo grub-mkconfig -o /boot/grub/grub.cfg"
info "  2. Reboot"
info "  3. After logging in, change wallpaper with skwd-wall and colors will auto-generate"
info "  4. Or run: matugen-wall  (to regenerate colors manually)"
