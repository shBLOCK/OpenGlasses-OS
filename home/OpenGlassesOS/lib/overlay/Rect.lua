local config = require("config")
local glasses_terminal = require("component").proxy(config.GLASSES_TERMINAL_ADDRESS)
local base_class = require("overlay/WidgetBasicBase")
local rect = {}
--local super_newWidget = rect.newWidget

function rect:newWidget()
  local new_widget = base_class:newWidget(glasses_terminal.addBox2D())
  new_widget.super_functions = base_class.addFunctions(self, {})

  new_widget.size = {0, 0}
  new_widget.widget.setSize(table.unpack(new_widget.size))
  new_widget.color = nil
  new_widget.color_modifier = nil
  new_widget.right_color = {1, 1, 1, 1}
  new_widget.left_color = {1, 1, 1, 1}
  new_widget.right_color_modifier = new_widget.widget.addColor(table.unpack(new_widget.right_color))
  new_widget.left_color_modifier = new_widget.widget.addColor(table.unpack(new_widget.left_color))
  return rect:addFunctions(new_widget)
end

function rect:addFunctions(new_widget)
  function new_widget:setSize(width, height)
    self.size = {width, height}
    self.widget.setSize(width, height)
  end

  function new_widget:setRightColor(r, g, b, a)
    if a == nil then
      a = self.right_color[4]
    end
    self.right_color_modifier = {r, g, b, a}
    self.widget.updateModifier(self.right_color_modifier, r, g, b, a)
  end

  function new_widget:setLeftColor(r, g, b, a)
    if a == nil then
      a = self.left_color[4]
    end
    self.left_color_modifier = {r, g, b, a}
    self.widget.updateModifier(self.left_color_modifier, r, g, b, a)
  end

  function new_widget:setColor(r, g, b, a)
    self.setRightColor(r, g, b, a)
    self.setLeftColor(r, g, b, a)
  end

  function new_widget:isPointInside(x, y)
    local render_pos = self.getRenderPosition()
    return (render_pos.x <= x <= render_pos.x + self.size[1] * self.scale[1]) and (render_pos.y <= y <= render_pos.y + self.size[2] * self.scale[2])
  end

  return new_widget
end

rect = setmetatable(rect, {
  __call = function (self)
    return self:newWidget()
  end
})

return rect
