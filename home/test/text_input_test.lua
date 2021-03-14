local glasses_terminal = require("component").glasses
local event = require("event")

glasses_terminal.removeAll()
text = glasses_terminal.addText2D()
text.addTranslation(10, 10, 0)

function keyboardCallback(_, _, _, _, key, _, _, _, _, _, _, _)
  text.setText(text.getText() .. key)
end

event.listen("keyboard_interact_overlay", keyboardCallback)
event.listen("interrupted", os.exit())

while true do
  os.sleep(0.05)
end
