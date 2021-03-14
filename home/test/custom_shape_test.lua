glasses = require("component").glasses

widget = glasses.addCustom2D()
widget.addAutoTranslation(50, 50)
widget.addScale(10, 10, 10)
widget.setCulling(false)
widget.setGLMODE("TRIANGLE_STRIP")
widget.addVertex(0.0, 0.0, 0.0)
widget.addVertex(0.0, 1.0, 0.0)
widget.addVertex(1.0, 1.0, 0.0)
widget.addVertex(1.0, 0.0, 0.0)
widget.addVertex(0.0, 0.0, 0.0)
widget.addColor(0.0, 1.0, 0.0, 1.0)

widget.addTranslation(0.5, 0.5, 0.5);
widget.setEasing(widget.addRotation(1, 0, 0, 1), "LINEAR", "IN", 1000, "deg", 0, 360, "repeat");
widget.addTranslation(-0.5, -0.5, -0.5);
