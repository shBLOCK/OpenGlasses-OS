event = require("event")

while true do
	print(event.pull())
	os.sleep(0.01)
end