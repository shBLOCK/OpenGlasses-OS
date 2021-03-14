--The base class for all the basic widgets (rect, text, custom2D...)
local config = require("config")
local glasses_terminal = require("component").proxy(config.GLASSES_TERMINAL_ADDRESS)
local base_class = require("overlay/Widget")
local basic_widget = {}

function basic_widget:newWidget(widget) --Require a OpenGlasses widget.
  local new_widget = base_class:newWidget()
  new_widget.super_functions = base_class.addFunctions(self, {})

  new_widget.widget = widget
  new_widget.removed = false
  new_widget.pos = {0, 0, 0}
  new_widget.alignment = {config.ALIGNMENT.HORIZONTAL.RIGHT, config.ALIGNMENT.VERTICAL.BOTTOM}
  new_widget.widget.setHorizontalAlign(new_widget.alignment[1])
  new_widget.widget.setVerticalAlign(new_widget.alignment[2])
  new_widget.scale = {1, 1, 1}
  new_widget.rotation_x = 0
  new_widget.rotation_y = 0
  new_widget.rotation_z = 0
  new_widget.pos_modifier = new_widget.widget.addTranslation(table.unpack(new_widget.pos))
  new_widget.scale_modifier = new_widget.widget.addScale(table.unpack(new_widget.scale))
  new_widget.rotation_x_modifier = new_widget.widget.addRotation(0, 1, 0, 0)
  new_widget.rotation_y_modifier = new_widget.widget.addRotation(0, 0, 1, 0)
  new_widget.rotation_z_modifier = new_widget.widget.addRotation(0, 0, 0, 1)
  new_widget.color = {1, 1, 1, 1}
  new_widget.color_modifier = new_widget.widget.addColor(table.unpack(new_widget.color))
  return basic_widget:addFunctions(new_widget)
end

function basic_widget:addFunctions(new_widget)
  function new_widget:getID()
    self.assertIfRemoved()
    return self.widget.getID()
  end

  function new_widget:removeWidget()
    self.super_functions.removeWidget(self)
    self.widget.removeWidget()
    self.widget = nil
    self.removed = true
  end

  function new_widget:setPos(x, y, z)
    self.super_functions.setPos(self, x, y, z)
    x = x or self.pos[1]
    y = y or self.pos[2]
    z = z or self.pos[3]
    self.pos = {x, y, z}
    self.widget.updateModifier(self.pos_modifier, x, y, z)
  end

  function new_widget:setAlignment(horizontal, vertical)
    self.assertIfRemoved()
    self.alignment[1] = horizontal or self.alignment[1]
    self.alignment[2] = vertical or self.alignment[2]
    if horizontal then new_widget.setHorizontalAlign(new_widget.alignment[1]) end
    if vertical then new_widget.setVerticalAlign(new_widget.alignment[2]) end
  end

  function new_widget:setScale(x, y, z)
    self.assertIfRemoved()
    x = x or self.scale[1]
    y = y or self.scale[2]
    z = z or self.scale[3]
    self.scale = {x, y, z}
    self.widget.updateModifier(self.scale_modifier, x, y, z)
  end

  function new_widget:setRotation(x, y, z)
    self.assertIfRemoved()
    if x ~= nil then
      self.widget.updateModifier(self.rotation_x_modifier, x, 1, 0, 0)
    end
    if y ~= nil then
      self.widget.updateModifier(self.rotation_y_modifier, y, 0, 1, 0)
    end
    if z ~= nil then
      self.widget.updateModifier(self.rotation_z_modifier, z, 0, 0, 1)
    end
  end

  function new_widget:setColor(r, g, b, a)
    self.assertIfRemoved()
    r = r or self.color[1]
    g = g or self.color[2]
    b = b or self.color[3]
    a = a or self.color[4]
    self.color = {r, g, b, a}
    self.widget.updateModifier(self.color_modifier, r, g, b, a)
  end

  function new_widget:setEasing(modifier, easing_function, easing_type, easing_mode, duration, variable_name, min, max)
    self.assertIfRemoved()
    self.widget.setEasing(modifier, easing_function, easing_type, duration, variable_name, min, max, easing_mode)
  end

  function new_widget.getRenderPosition()
    self.assertIfRemoved()
    return self.widget.getRenderPosition(config.PLAYER_NAME, config.RESOLUTION.width, config.RESOLUTION.height)
  end

  function new_widget:isPointInside(x, y)
    self.assertIfRemoved()
  end

  return new_widget
end

return basic_widget
