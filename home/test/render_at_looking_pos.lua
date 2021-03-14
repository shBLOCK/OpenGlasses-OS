glasses = require("component").glasses
glasses.setRenderPosition("absolute")

widget = glasses.addCube3D()
translation = widget.addTranslation(0, 0, 0)
while true do
	data = glasses.getUserLookingAt("shBLOCK")
	widget.modifiers()[translation].set(data.x, data.y, data.z)
	os.sleep(0.001)
end