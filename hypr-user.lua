----------------------------------------------------
----------------------------------------------------
hl.bind("SUPER + J", hl.dsp.exec_cmd("caelestia shell drawers toggle bar"), { description = "Shell: Toggle bar" })
hl.bind("SUPER + Y", hl.dsp.exec_cmd("kitty -1 yazi"), { description = "open yazi file manager" })
hl.bind("SUPER + I", hl.dsp.exec_cmd("caelestia shell nexus open"), { description = "open setting" })
hl.bind("ALT + F4", hl.dsp.exec_cmd("poweroff"), { description = "Window: Close" })
hl.unbind("SUPER + D")
hl.bind(
	"SUPER + D",
	hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }),
	{ description = "Window: Maximize" }
)
hl.unbind("SUPER+T")
hl.bind(
	"SUPER+T",
	hl.dsp.exec_cmd("caelestia shell drawers toggle dashboard"),
	{ description = "Shell: Toggle dashboard" }
)
hl.bind("SUPER + TAB", hl.dsp.exec_cmd("qs ipc -c overview call overview toggle"))
---------------------------------------------------
---------------------------------------------------
hl.unbind("SUPER + P")
hl.bind("XF86launch2", hl.dsp.workspace.toggle_special("PDF"), { description = "Workspace: Toggle PDF" })

local function move_document(win)
	if win.class == "org.kde.okular" then
		hl.dispatch(hl.dsp.window.move({
			window = win,
			workspace = "special:PDF",
			follow = false,
		}))
	end
end
----------------------------------------------------
----------------------------------------------------
hl.bind(
	"XF86Calculator",
	hl.dsp.exec_cmd("/home/aman/.config/caelestia/secret.sh"),
	{ description = "Secret: unlock workspace" }
)
hl.on("window.open", move_document)
local function guard_secret_apps(win)
	if win.class == "brave-browser" then
		local ws = win.workspace
		if not ws or ws.name ~= "special:secret" then
			hl.dispatch(hl.dsp.window.close({ window = win }))
		end
	end
end
hl.on("window.open", guard_secret_apps)
local function destroy_secret()
	local ws = hl.get_workspace("special:secret")
	if not ws or ws.windows == 0 then
		return
	end
	for _, win in ipairs(ws:get_windows() or {}) do
		hl.dispatch(hl.dsp.window.close({ window = win }))
	end
end

hl.on("workspace.active", function()
	local active = hl.get_active_workspace()
	if active and active.name ~= "special:secret" then
		destroy_secret()
	end
end)

hl.on("workspace.special_active", function()
	local spec = hl.get_active_special_workspace()
	if not (spec and spec.name == "secret") then
		destroy_secret()
	end
end)
---------------------------------------------------
---------------------------------------------------
hl.on("hyprland.start", function()
	hl.exec_cmd("qs -c overview")
end)
---------------------------------------------------
---------------------------------------------------
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
---------------------------------------------------
---------------------------------------------------
--volume
hl.gesture({
	fingers = 3,
	direction = "down",
	action = function()
		hl.dispatch(
			hl.dsp.exec_cmd(
				"wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ " .. 10 .. "%-"
			)
		)
	end,
})
hl.gesture({
	fingers = 3,
	direction = "up",
	action = function()
		hl.dispatch(
			hl.dsp.exec_cmd(
				"wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l "
					.. (100 / 100)
					.. " @DEFAULT_AUDIO_SINK@ "
					.. 10
					.. "%+"
			)
		)
	end,
})
--brightness
hl.gesture({
	fingers = 3,
	direction = "right",
	action = function()
		hl.dispatch(hl.dsp.global("caelestia:brightnessUp"))
	end,
})
hl.gesture({
	fingers = 3,
	direction = "left",
	action = function()
		hl.dispatch(hl.dsp.global("caelestia:brightnessDown"))
	end,
})
------------------------------------------------------------
------------------------------------------------------------
hl.config({
	render = {
		expand_undersized_textures = false,
	},
	decoration = {
		blur = {
			-- noise = 0.3,
			contrast = 2,
		},
	},
})
--move window
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
