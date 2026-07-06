hl.unbind("SUPER + C")
hl.unbind("SUPER + X")
hl.bind("SUPER + C", hl.dsp.exec_cmd("/usr/bin/brave"), { description = "App: Brave" })
hl.bind("SUPER + X", hl.dsp.exec_cmd("kitty -1 nvim"), { description = "App: LazyVim" })

hl.bind("ALT + F4", hl.dsp.window.close(), { non_consuming = true })

hl.bind(
	"CTRL+SUPER+Slash",
	hl.dsp.exec_cmd("xdg-open ~/.config/illogical-impulse/config.json"),
	{ description = "User: Edit shell config" }
)
hl.bind(
	"CTRL+SUPER+ALT+Slash",
	hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"),
	{ description = "User: Edit keybinds" }
)
