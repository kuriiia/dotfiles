
Packages and configuration needed to run the niri config on a fresh Arch install.

## Prerequisites

An AUR helper is required for some packages, paru or yay.
## Official repo packages

```bash
sudo pacman -S --needed \
  niri \
  xwayland-satellite \
  satty \
  playerctl \
  pipewire-pulse \
  polkit-gnome \
  qt6ct \
  xkeyboard-config \
  nwg-look \
  grim \
  slurp \
  wl-clipboard \
  jq
```

## AUR packages

```bash
yay -S --needed \
  noctalia \
  bibata-cursor-theme \
  newaita-reborn-icons-git
```

> `noctalia-shell` is the stable old release. Use `noctalia-git` it's better

## Fonts

```bash
yay -S --needed \
  ttf-inter \
  nerd-fonts-meslo-lg
```

## Post-install

Copy everything from the `niri` folder to `~/.config/niri`

Super + / to see shortcuts.

### Apps

Change to your preferred programs at line 144-148 in `~/.config/niri/config.kdl`

| App                     | Keybind       |
| ----------------------- | ------------- |
| Kitty (terminal)        | `Super+Space` |
| Firefox                 | `Super+B`     |
| Nautilus (file manager) | `Super+N`     |
| Zed (editor)            | `Super+Z`     |
| Spotify                 |               |

### Noctalia

| Keybind | Action |
|---------|--------|
| `Super+A` | Toggle launcher panel |
| `Super+Return` | Toggle control center |
| `Super+S` | Toggle settings |

Noctalia auto-generates color schemes for qt6, kitty, ghostty, and other apps
based on the active wallpaper. Toggle on your apps in settings -> templates to get one theme for all your apps.

### GTK settings

Use **nwg-look** to configure GTK3/GTK4 themes, cursors, icons, and fonts.

```bash
nwg-look
```

### Qt6 settings

Use **qt6ct** to configure Qt6 themes, fonts, and palettes.

```bash
qt6ct
```
### Screenshots

See [screenshot.md](../.config/niri/screenshot.md) for keybinds, the `shots`
script, and `satty` configuration.

### Cursor

Set in `config.kdl:30-33`:

```kdl
cursor {
    xcursor-size 22
    xcursor-theme "Bibata-Modern-Classic"
}
```

Change `xcursor-theme` to any installed cursor theme. Adjust size as needed.

### Icons

The icon theme is configured in nwg-look and qr6ct :

get icons and mouse cursors from https://www.opendesktop.org/

Icons i use https://github.com/vinceliuice/Fluent-icon-theme

### Output

Single monitor layout in `config.kdl:23-28`. 
Run `niri msg outputs` to get your output and change accordingly.

```kdl
output "eDP-1" {
    mode "1920x1080@60.020"
    scale 1
    transform "normal"
    position x=0 y=0
}
```

### Keybinds

Full keybinds are in `config.kdl:127-283`. Summary:

| Keybind | Action |
|---------|--------|
| `Super+Slash` | Show hotkey overlay |
| `Super+E` / `Ctrl+Alt+Delete` | Quit niri |
| `Super+Q` | Close window |
| `Super+F` | Maximize column |
| `Super+Alt+F` | Fullscreen window |
| `Super+V` | Toggle floating |
| `Super+R` | Cycle column width presets |
| `Super+H/L` | Focus left/right column |
| `Super+J/K` | Focus down/up window |
| `Super+Alt+H/L` | Move column left/right |
| `Super+Alt+J/K` | Move window down/up |
| `Super+U/I` | Focus workspace down/up |
| `Super+1-9` | Jump to workspace by index |
| `Super+X` | Toggle overview |
| `Print` | Screenshot (see screenshot.md) |
| `Insert` | Toggle screen recording (noctalia) |

### Window rules

Defined in `config.kdl:286-353`:

- **Firefox PiP** — opens floating (`config.kdl:292-295`)
- **KeePassXC** — blocked from screen capture (`config.kdl:298-301`)
- **Satty** — opens floating (`config.kdl:317-320`)
- **Noctalia settings** — floating, fixed 1080x920 (`config.kdl:331-336`)
- **All windows** — rounded corners radius 22 (`config.kdl:323-326`)

### Animations

In the `config.kdl` the animations start from line 70. you can switch out the code and use one from the `animations` folder, find which you like.

### Lid close

Laptop lid close triggers lock-and-suspend via noctalia (`config.kdl:350-352`).
