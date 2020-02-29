require("class")
require("button")
require("pushbutton")
require("cubedispenser")
require("box")
require("physics")
require("firework")
require("flower")
-- Image data
cubedispenserimg = love.graphics.newImage("graphics/SMB/cubedispenser.png")
pushbuttonimg = love.graphics.newImage("graphics/SMB/pushbutton.png")
buttonbaseimg = love.graphics.newImage("graphics/SMB/buttonbase.png")
buttonbuttonimg = love.graphics.newImage("graphics/SMB/buttonbutton.png")
flowerimg = love.graphics.newImage("graphics/SMB/flower.png")
-- global info
xscroll = 0
width = 100
scale = 1
-- Add userect for some reason this is needed.
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
-- userects table
userects = {}
-- class tables
butt = {}
push = {}
cubedisp = {}
-- Position variables
flowerX = 20
flowerY = 20

buttonx = 10
buttony = 10

-- Quad tables go here
flowerquad = {}

-- Quad declarations if they are built as a table (no for loops)
pushbuttonquad = {
	love.graphics.newQuad(0, 0, 16, 16, 32, 16), 
	love.graphics.newQuad(16, 0, 16, 16, 32, 16)
}

-- timer needs to be bigger than 0
mushroomtime = 1
pushbuttontime = 1
cubedispensertime = 1


staranimationdelay = 10

-- Object tables
objects = {}
objects["button"] = {}
objects["pushbutton"] = {}
objects["cubedisp"] = {}
objects["box"] = {}
objects["firework"] = {} 


custommusic = false


test = {
	load = function() -- load called one time, before update.
		-- This is all the items needed before we can start running code in the update loop.
		
		-- Quad data when they use for loops
		for i = 1, 4 do
			flowerquad[i] = love.graphics.newQuad((i-1)*16, 0, 16, 16, 64, 16)
		end

		-- init class objects
		push = pushbutton:new(buttonx-2,buttony,"left")
		butt = button:new(buttonx,buttony)
		cubedisp = cubedispenser:new(buttonx, buttony-5,5)
		flowy = flower:new(flowerX, flowerY);
	end,
	update = function(dt) -- update, called every frame. put physics and movement code here
		
		-- class object update functions
		push:update(dt)
		butt:update(dt)
		cubedisp:update(dt)
		flowy:update(dt)
	end,
	draw = function() -- draw, called after every update frame. put all draw and print calls.
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
		--love.graphics.print(marioscore,40,15)
		cubedisp:draw()
		push:draw()
		butt:draw()
		--fireworks:draw()
		flowy:draw()
		if flowy.x + 6/16 == flowerX then
			love.graphics.print("FLOWER",250,250)
		end
	end,
	keypress = function(key) -- keypress, called on every keypress.
		if key == 'q' then
			push:used()
		end
		if key == 'e' then
			
		end
		if key == 'r' then
			
		end
	end
	keyrelease = function(key) -- keyrelease, called on every keyrelease.
		
	end
}
