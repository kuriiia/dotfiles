local home = os.getenv("HOME") or ""
local scriptsDir = home .. "/.config/hypr/scripts"

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpm reload && hyprctl reload")
    -- hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)
