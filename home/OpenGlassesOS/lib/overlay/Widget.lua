--The base class for all the widget classes, just because I want to treat all the widgets in the same way
local widget = {}

function widget:newWidget()
  local new_widget = {}
  new_widget.contains_widget = {}
  new_widget.removed = false

  return widget:addFunctions(new_widget)
end

function widget:addFunctions(new_widget)
  function new_widget:assertIfRemoved()
    assert(self.removed, "Can't access a removed widget!")
  end

  function new_widget:processEvent(event)
    self.assertIfRemoved()
  end

  function new_widget:setPos(x, y, z)
    self.assertIfRemoved()
  end

  function new_widget:removeWidget()
    self.assertIfRemoved()
  end

  return new_widget
end

return widget
