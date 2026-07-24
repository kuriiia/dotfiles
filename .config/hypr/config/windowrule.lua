hl.window_rule({
    match = { title = "firefox" },
    workspace = "2 silent",
})

hl.window_rule({
    match = { title = "Picture-in-Picture" },
    float = true,
})

hl.window_rule({
    match = { title = "Picture-in-Picture" },
    move = "100%-w-14 100%-w-7",
})

hl.window_rule({
    match = { title = "Picture-in-Picture" },
    pin = true,
})

hl.window_rule({
    match = { class = "preview-image" },
    float = true,
})

hl.window_rule({
    match = { class = "preview-image" },
    move = "cursor -50% -50%",
})

hl.window_rule({
    match = { title = "booru-image" },
    float = true,
})

hl.window_rule({
    match = { title = "booru-image" },
    move = "cursor -50% -50%",
})

hl.window_rule({
    match = { class = "^(grass)" },
    workspace = "9 silent",
})
