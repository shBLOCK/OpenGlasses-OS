glasses = require("component").glasses
for i=1,10000 do
	w = glasses.addBox2D()
	w.setSize(1, 1)
	r = math.random()
	g = math.random()
	b = math.random()
	w.addColor(r, g, b, 0.5)
	w.addColor(r, g, b, 0.5)
	w.addAutoTranslation(math.random(500, 9500) / 100, math.random(500, 9500) / 100)
	os.sleep(0.001)
end