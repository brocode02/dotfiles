hl.window_rule({ match = { class = "^(kitty)$" }, no_blur = true })
hl.window_rule({ match = { class = "^(kitty)$" }, border_color = "rgba(1793d1DD) rgba(1793d177)" })
hl.window_rule({ match = { class = "^(Tk)$" }, float = true })
-- DaVinci Resolve - force XWayland (confirmed: class="resolve", xwayland=1)
hl.window_rule({
	name = "resolve-xwayland",
	match = { class = "resolve" },
	xwayland = true,
})

-- Pin to workspace, no gaps - main editor window only
hl.window_rule({
	name = "resolve-workspace",
	match = { class = "resolve" },
	workspace = 5,
	no_gaps = true,
})

-- Don't let it get killed mid-render/cache-flush on close
hl.window_rule({
	name = "resolve-noclose",
	match = { class = "resolve" },
	no_close_for = 2000,
})
