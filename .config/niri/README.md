# Niri Configuration

## Overview

This is a configuration for [Niri](https://github.com/YaLTeR/niri), a scrollable-tiling Wayland compositor. It includes custom shaders, Noctalia panel integration, and a curated set of keybinds.

## Dependencies

### Core

| Package | Purpose |
|---------|---------|
| `niri` | Wayland compositor |
| `noctalia` (v5.0+) | Panel/bar, notification center, volume/brightness control, session lock |
| `xwayland-satellite` | XWayland support for legacy X11 apps |
| `polkit-gnome` | Privilege escalation prompts (`/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1`) |

### Screenshot Pipeline

| Package | Purpose |
|---------|---------|
| `grim` | Screenshot capture |
| `slurp` | Region selection |
| `satty` | Annotation tool (floating window) |
| `wl-clipboard` | `wl-paste` for clipboard operations |
| `jq` | JSON parsing in `shots` script |
| `playerctl` | Media key control (play/pause/next/prev) |

### Cursor

- Theme: `Bibata-Modern-Classic` (size 22)

### Qt Integration

- `qt6ct` for Qt theming (env `QT_QPA_PLATFORMTHEME=qt6ct`)

## Keybinds

### General

| Binding | Action |
|---------|--------|
| `Super+/` | Show hotkey overlay |
| `Super+E` | Quit niri |
| `Ctrl+Alt+Delete` | Quit niri |

### Applications

| Binding | Action |
|---------|--------|
| `Super+Space` | Terminal (kitty) |
| `Super+B` | Browser (firefox) |
| `Super+N` | File manager (nautilus) |
| `Super+Z` | Editor (zed) |

### Noctalia Panels

| Binding | Action |
|---------|--------|
| `Super+A` | Toggle launcher panel |
| `Super+Return` | Toggle control center |
| `Super+S` | Toggle settings |

### Window Management

| Binding | Action |
|---------|--------|
| `Super+Q` | Close window |
| `Super+R` | Cycle preset column widths (33% / 50% / 67%) |
| `Super+Alt+R` | Cycle preset window heights |
| `Super+Ctrl+R` | Reset window height |
| `Super+F` | Maximize column |
| `Super+Alt+F` | Fullscreen window |
| `Super+Ctrl+F` | Expand column to available width |
| `Super+Ctrl+C` | Center visible columns |
| `Super+V` | Toggle floating |
| `Super+Alt+V` | Switch focus between floating and tiling |
| `Super+X` | Toggle overview |

### Resize

| Binding | Action |
|---------|--------|
| `Super+-` / `Super+=` | Shrink / grow column by 10% |
| `Super+Shift+-` / `Super+Shift+=` | Shrink / grow window height by 10% |

### Column Consume / Expel

| Binding | Action |
|---------|--------|
| `Super+,` | Consume window into column |
| `Super+.` | Expel window from column |
| `Super+[` | Consume or expel left |
| `Super+]` | Consume or expel right |

### Focus Navigation

| Binding | Action |
|---------|--------|
| `Super+H` / `Super+Left` | Focus column left |
| `Super+L` / `Super+Right` | Focus column right |
| `Super+J` | Focus window down |
| `Super+K` | Focus window up |

### Move Columns / Windows

| Binding | Action |
|---------|--------|
| `Super+Alt+H` / `Super+Alt+Left` | Move column left |
| `Super+Alt+L` / `Super+Alt+Right` | Move column right |
| `Super+Alt+J` | Move window down |
| `Super+Alt+K` | Move window up |

### Workspaces

| Binding | Action |
|---------|--------|
| `Super+U` / `Super+Down` | Focus workspace down |
| `Super+I` / `Super+Up` | Focus workspace up |
| `Super+Ctrl+U` / `Super+Alt+Down` | Move column to workspace down |
| `Super+Ctrl+I` / `Super+Alt+Up` | Move column to workspace up |
| `Super+Shift+U` / `Super+Shift+Down` | Move workspace down |
| `Super+Shift+I` / `Super+Shift+Up` | Move workspace up |
| `Super+1-9` | Jump to workspace by index |
| `Super+Alt+1-9` | Move column to workspace by index |

### Scroll Navigation

| Binding | Action |
|---------|--------|
| `Super+Alt+Scroll` | Switch workspaces |
| `Super+Shift+Alt+Scroll` | Move column to workspace |
| `Super+Scroll` | Focus column |
| `Super+Shift+Scroll` | Move column |

### Screenshots

| Binding | Action | Tool |
|---------|--------|------|
| `Print` | Region screenshot + annotate | `shots region` (grim+slurp+satty) |
| `Alt+Print` | Monitor screenshot + annotate | `shots monitor-focused` (grim+satty) |
| `Super+Print` | Region screenshot (no annotation) | niri built-in |
| `Ctrl+Print` | Fullscreen screenshot (no annotation) | niri built-in |

Screenshot path: `~/Pictures/Screenshots/Shot from %Y-%m-%d %H-%M-%S.png`

### Hardware Keys

| Binding | Action |
|---------|--------|
| `XF86AudioRaise/Lower Volume` | Volume up/down via noctalia |
| `XF86AudioMute` | Mute via noctalia |
| `XF86AudioMicMute` | Toggle microphone mute via wpctl |
| `XF86MonBrightnessUp/Down` | Brightness up/down via noctalia |
| `XF86AudioPlay/Pause/Stop/Prev/Next` | Media control via playerctl |

## Layout

- Gaps: 2px
- Default column width: 50% of output
- Preset widths: 33.3%, 50%, 66.7%
- Focus ring: off (controlled by noctalia colors)
- Border: off (controlled by noctalia colors)
- Shadow: enabled (softness 15, spread 10)
- Rounded corners: 22px radius on all windows
- Center-focused-column: never
- Workspaces: "a" (firefox), "b" (spotify)

## Output

- `eDP-1`: 1920x1080 @ 60Hz, scale 1, normal transform

## Window Rules

| Rule | Effect |
|------|--------|
| Firefox PiP | Opens floating |
| KeePassXC | Blocked from screen capture |
| Firefox | Opens maximized on workspace "a" |
| Spotify | Opens maximized on workspace "b" |
| Satty | Opens floating |
| Noctalia settings | Opens floating (1080x920) |
| All windows | Rounded corners (22px) |

## Animations (Active: Bounce)

The config uses the **bounce** animation preset (inlined in `config.kdl`). Other presets are available in `animations/`:

| File | Style |
|------|-------|
| `niri_bounce.txt` | Spring-based, subtle bounce (active) |
| `niri_burn.txt` | Fire/erosion dissolve effect with custom shaders |
| `niri_liquid.txt` | Fluid/water caustic effect with slowdown 1.5x |
| `niri_portal.txt` | Circular reveal with neon ring (1.5x slowdown) |
| `niri_spontanious.txt` | Scale+slide with cubic-bezier easing |

To swap animations, copy the contents of the desired `.txt` file into the `animations {}` block in `config.kdl`.

## Additional Files

- `screenshot.md`: Documentation for the screenshot setup
- `noctalia.kdl`: Noctalia color scheme (focus ring, border, shadow, tab indicator, insert hint colors)
- `~/.local/bin/shots`: Screenshot helper script

## Session Behavior

- Lid close: Lock and suspend (via noctalia)
- CSD: Prefer server-side decorations (`prefer-no-csd`)
- Hotkey overlay: Skipped at startup
