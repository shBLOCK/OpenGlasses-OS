fh = io.open("suzanne.obj", "r")
objData = fh:read("*a")
fh:close()

glasses = require("component").glasses
glasses.removeAll()
customOBJ = glasses.addOBJModel3D()
customOBJ.loadOBJ(objData)
customOBJ.addTranslation(0, 2.5, 0)
while true do
	customOBJ.addColor(0, 1, 0, 1)
	os.sleep(0.05)
	customOBJ.addColor(1, 1, 0, 1)
	os.sleep(0.05)
end