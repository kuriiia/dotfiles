local home = os.getenv("HOME") or ""
local scriptsDir = home .. "/.config/hypr/scripts"
local screenshot = scriptsDir .. "/screenshot.sh"
local terminal = "kitty"
local resizeAmount = 25
local changeBrightness = scriptsDir .. "/change-brightness.sh"

hl.config({
    binds = {
        workspace_back_and_forth = 1,
        allow_workspace_cycles = 1,
        pass_mouse_when_bound = 0,
    },
})

local mainMod = "SUPER"

-- Window Management
--- fullscreen active window
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
--- close active window
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
--- kill active window
hl.bind(mainMod .. " + ALT + Q", hl.dsp.window.kill())
--- float for active window
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
--- pin active window
hl.bind(mainMod .. " + ALT + V", hl.dsp.window.pin())

-- Open Apps
--- open terminal
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(terminal))
--- open floating terminal
hl.bind(mainMod .. " + ALT + Space", hl.dsp.exec_cmd("[float] " .. terminal))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("zeditor"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("nautilus"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("firefox"))

-- Status Bar and Panels
--- restart status bar
-- hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(statusBar))
-- --- toggle app launcher
-- hl.bind(mainMod .. " + SUPER_L", hl.dsp.exec_cmd("ags request search " .. monitor))
-- --- toggle media panel
-- hl.bind(mainMod .. " + m", hl.dsp.exec_cmd("ags toggle media-" .. monitor))
-- --- toggle right panel
-- hl.bind(mainMod .. " + r", hl.dsp.exec_cmd("ags toggle right-panel-" .. monitor))
-- --- toggle left panel
-- hl.bind(mainMod .. " + l", hl.dsp.exec_cmd("ags toggle left-panel-" .. monitor))
-- --- toggle wallpaper switcher
-- hl.bind(mainMod .. " + w", hl.dsp.exec_cmd("ags toggle wallpaper-switcher-" .. monitor))
-- --- toggle user panel
-- hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("ags toggle user-panel-" .. monitor))
-- --- open clipboard manager
-- hl.bind(mainMod .. " + SHIFT + v", hl.dsp.exec_cmd("ags request clipboard " .. monitor))
-- --- open emoji picker
-- hl.bind(mainMod .. " + period", hl.dsp.exec_cmd("ags request emojis " .. monitor))
-- --- open notes app
-- hl.bind(mainMod .. " + SHIFT + n", hl.dsp.exec_cmd("ags request notes " .. monitor))
-- --- open all apps
-- hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("ags request apps " .. monitor))

-- Screenshot and Screen Record Keybinds
--- screenshot workspace
hl.bind("Print", hl.dsp.exec_cmd(screenshot .. " --now"))
--- screenshot area
hl.bind("CTRL + Print", hl.dsp.exec_cmd(screenshot .. " --area"))
--- screen record workspace
-- hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("ags request screenrecord now"))
-- --- screen record area
-- hl.bind(mainMod .. " + CTRL + SHIFT + R", hl.dsp.exec_cmd("ags request screenrecord area"))

-- Special Workspace Keybinds
--- move to special workspace
hl.bind(mainMod .. " + CTRL + S", hl.dsp.window.move({ workspace = "special" }))
--- toggle special workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special())


-- Media, Brightness and Volume Controls
--- volume up
hl.bind("F12", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
--- volume down
hl.bind("F11", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
--- volume up
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
--- volume down
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
--- toggle mute
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

--- brightness up
hl.bind("F3", hl.dsp.exec_cmd(changeBrightness .. " +10"), { locked = true, repeating = true })
--- brightness down
hl.bind("F2", hl.dsp.exec_cmd(changeBrightness .. " -10"), { locked = true, repeating = true })
--- brightness up
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(changeBrightness .. " +10"), { locked = true, repeating = true })
--- brightness down
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(changeBrightness .. " -10"), { locked = true, repeating = true })

-- System Controls
--- lock
-- hl.bind(mainMod .. " + SHIFT + Escape", hl.dsp.exec_cmd(lock))
-- --- suspend
-- hl.bind(mainMod .. " + CTRL + Escape", hl.dsp.exec_cmd(suspend))
--- shutdown
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("shutdown now"))

-- Window Resize, Move and Focus
--- expand left
hl.bind(mainMod .. " + ALT + left", hl.dsp.window.resize({ x = -resizeAmount, y = 0, relative = true }),
    { repeating = true })
--- expand right
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.resize({ x = resizeAmount, y = 0, relative = true }),
    { repeating = true })
--- expand up
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.resize({ x = 0, y = -resizeAmount, relative = true }),
    { repeating = true })
--- expand down
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.resize({ x = 0, y = resizeAmount, relative = true }),
    { repeating = true })

--- move left
hl.bind(mainMod .. " + left", hl.dsp.window.move({ direction = "l" }))
--- move right
hl.bind(mainMod .. " + right", hl.dsp.window.move({ direction = "r" }))
--- move up
hl.bind(mainMod .. " + up", hl.dsp.window.move({ direction = "u" }))
--- move down
hl.bind(mainMod .. " + down", hl.dsp.window.move({ direction = "d" }))

--- focus left
hl.bind("ALT + left", hl.dsp.focus({ direction = "left" }))
--- focus right
hl.bind("ALT + right", hl.dsp.focus({ direction = "right" }))
--- focus up
hl.bind("ALT + up", hl.dsp.focus({ direction = "up" }))
--- focus down
hl.bind("ALT + down", hl.dsp.focus({ direction = "down" }))

-- Workspace Keybinds
for i = 1, 10 do
    local key = i % 10
    --- switch workspace [key]
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    --- move to workspace [key]
    hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i }))
    --- silent move to workspace [key]
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- NumPad Workspaces Keybinds
local numpad_keys = {
    "KP_End",
    "KP_Down",
    "KP_Next",
    "KP_Left",
    "KP_Begin",
    "KP_Right",
    "KP_Home",
    "KP_Up",
    "KP_Prior",
    "KP_Insert"
}

for index, key_name in ipairs(numpad_keys) do
    local workspace_id = tostring(index + 10)

    --- switch Workspace [key]
    hl.bind(mainMod .. " + " .. key_name, hl.dsp.focus({ workspace = workspace_id }))
    --- move to workspace [key]
    hl.bind(mainMod .. " + CTRL + " .. key_name, hl.dsp.window.move({ workspace = workspace_id }))
    --- silent move to workspace [key]
    hl.bind(mainMod .. " + SHIFT + " .. key_name, hl.dsp.window.move({ workspace = workspace_id, follow = false }))
end

--- previous workspace
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "prev" }))

--- next workspace
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
--- previous workspace
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

--- move to next workspace
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
--- move to previous workspace
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
