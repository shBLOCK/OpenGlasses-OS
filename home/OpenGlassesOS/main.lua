--Main script for the OS
package.path = package.path .. ";/home/OpenGlassesOS/lib/?.lua;/home/OpenGlassesOS/lib/?/init.lua;/home/OpenGlassesOS/?.lua"

local event = require("event")
local thread = require("thread")

function event.onError(message)
  print(message)
end

event_list = {}
local widget_list = {}

local event_handler_thread = thread.create(function ()
  while true do
    e = table.pack(event.pull())
    table.insert(event_list, #event_list + 1, e)
  end
end)

function processEvent(e)
  local type = e[1]
  if type == "interrupted" then
    os.exit()
  end
end

while true do
  while #event_list ~= 0 do
    processEvent(table.remove(event_list))
  end
  os.sleep(0.05)
end
