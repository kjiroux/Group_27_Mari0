require("class")
require("button")
require("pushbutton")
require("cubedispenser")
require("box")
require("physics")
cubedispenserimg = love.graphics.newImage("graphics/SMB/cubedispenser.png")
pushbuttonimg = love.graphics.newImage("graphics/SMB/pushbutton.png")
pushbuttonquad = {love.graphics.newQuad(0, 0, 16, 16, 32, 16), love.graphics.newQuad(16, 0, 16, 16, 32, 16)}
pushbuttontime = 1
cubedispensertime = 1
buttonbaseimg = love.graphics.newImage("graphics/SMB/buttonbase.png")
buttonbuttonimg = love.graphics.newImage("graphics/SMB/buttonbutton.png")
userects = {}
xscroll = 0
width = 100
function adduserect(x, y, width, height, callback)
	local t = {}
	t.x = x
	t.y = y
	t.width = width
	t.height = height
	t.callback = callback
	t.delete = false
	table.insert(userects, t)
	return t
end
buttonx = 10
buttony = 10
scale = 1
butt = {}
push = {}
cubedisp = {}

objects = {}
objects["button"] = {}
objects["pushbutton"] = {}
objects["cubedisp"] = {}
objects["box"] = {}


custommusic = false


test = {
	load = function()
		push = pushbutton:new(buttonx-2,buttony,"left")
		butt = button:new(buttonx,buttony)
		cubedisp = cubedispenser:new(buttonx, buttony-5,5)
		
	end,
	update = function(dt)
		push:update(dt)
		butt:update(dt)
		cubedisp:update(dt)
	end,
	draw = function()
		love.graphics.print("init function:",5,5)
		if push.cox == buttonx and push.coy == buttony then
			love.graphics.print("Yay",5,15)
		else
			love.graphics.print("Boo",5,15)
		end
		love.graphics.print("used function:",5,25)
		if push.pusheddown then
			love.graphics.print("Yay",5,35)
		else
			love.graphics.print("Boo",5,35)
		end
		love.graphics.print("Yay all done!",5,45)
		cubedisp:draw()
		push:draw()
		butt:draw()
	end,
	keypress = function(key)
		if key == 'q' then
			push:used()
		end
		if key == 'e' then
			
		end
		if key == 'r' then
			
		end
	end
}
