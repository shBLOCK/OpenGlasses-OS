package.path = package.path .. ";/home/OpenGlassesOS/lib/?.lua;/home/OpenGlassesOS/lib/?/init.lua;/home/OpenGlassesOS/?.lua"

print("running")

local rect = require("overlay/Rect")
w = rect()
