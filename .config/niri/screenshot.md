# Better Screenshots

## Keybinds

| Binding         | Action                                     | Tool             |
|-----------------|--------------------------------------------|------------------|
| `Print`         | Select region, annotate with satty         | `shots region`   |
| `Alt+Print`     | Capture focused output, annotate with satty| `shots monitor-focused` |
| `Super+Print`   | Quick region save (no annotation)          | niri `screenshot` |
| `Ctrl+Print`    | Quick fullscreen save (no annotation)      | niri `screenshot-screen` |

## Files

Add this to your `~/.local/bin/` and save as shots
```bash
#!/usr/bin/env bash
# Take a screenshot in a number of different ways. Any of the case statement
# options can be passed in as a value.

set -o errexit
set -o pipefail
set -o nounset

MODE="${1:-region}"

case "${MODE}" in
region)
  grim -g "$(slurp -d)" -
  ;;
window)
  niri msg action screenshot-window
  sleep 0.5
  wl-paste --type image/png
  ;;
monitor-focused)
  grim -o "$(niri msg --json focused-output | jq --raw-output .name)" -
  ;;
*)
  echo "'${MODE}' is not a supported, aborting!" >&2
  exit 1
  ;;
esac | satty --filename - --output-filename "~/Pictures/Screenshots/Shot from %Y-%m-%d %H-%M-%S.png"
```

Run this to make it executable
```bash
chmod +x ~/.local/bin/shots
```

### Dependencies
The script depends on `grim`, `slurp`, and `satty`.
```bash
sudo pacman -S grim slurp wl-clipboard satty
```

### Satty window rule (floating)
Add a window rule in `config.kdl` so it opens floating:
```kdl
window-rule {
    match app-id="com.gabm.satty"
    open-floating true
}
```

### Satty Enter to save
Configure `actions-on-enter` in `~/.config/satty/config.toml` so pressing Enter saves the file:
```toml
[general]
early-exit = true
copy-command = "wl-copy --type image/png"
initial-tool = "brush"
actions-on-enter = ["save-to-file"]
```

> Note
> we are still using the default niri screenshot tool. so don't remove screenshot path from the config.kdl
