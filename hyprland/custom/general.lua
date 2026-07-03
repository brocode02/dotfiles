hl.config({
	general = {
		border_size = 2,
	},
	decoration = {
		blur = {
			size = 8,
			passes = 2,
			noise = 0.03,
			contrast = 0.92,
			vibrancy = 0.35,
		},
	},
	render = {
		explicit_sync = 2,
	},
})

-- hl.gesture({
--     fingers = 3,
--     direction = "pinch",
--     action = "float"
-- })
--
-- hl.gesture({
--     fingers = 4,
--     direction = "down",
--     action = function()
--         hl.dispatch(hl.dsp.global("quickshell:overviewWorkspacesClose"))
--     end
-- })
