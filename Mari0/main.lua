
require("tests.test")
local keypress = "no key"
function love.load()
	test.load()	
end
function love.update(dt)
	test.update(dt)
end
function love.draw()
	love.graphics.print(keypress,5,95)
	test.draw()
end
function love.keypressed(key)
	keypress = key
	test.keypress(key)
end
function love.keyreleased()
	keypress = "no key"
end
