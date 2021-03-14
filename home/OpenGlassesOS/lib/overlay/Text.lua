local config = require("config")
local glasses_terminal = require("component").proxy(config.GLASSES_TERMINAL_ADDRESS)
local text = require("overlay/WidgetBasicBase")
local super_newWidget = text.newWidget

function text:newWidget()
  local new_widget = super_newWidget(glasses_terminal.addText2D())

  new_widget.text = ""

  return new_widget
end

return text
