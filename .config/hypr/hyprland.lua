-- -- Hyprland Lua config entrypoint.
hl.env("XDG_MENU_PREFIX,arch-", "1")
hl.env("XDG_CURRENT_DESKTOP,Hyprland", "1")
hl.env("XDG_SESSION_TYPE,wayland", "1")
hl.env("XDG_SESSION_DESKTOP,Hyprland", "1")

local function require_all(configs)
    for _, name in ipairs(configs) do
        require("config." .. name)
    end
end

require_all({
    "animations",
    "bind",
    "decoration",
    "env",
    "exec",
    "general",
    "gesture",
    "input",
    "layouts",
    "misc",
    "monitor",
    "windowrule",
    "workspace",
})
