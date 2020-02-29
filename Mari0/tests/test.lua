require("class")
require("button")
require("pushbutton")
require("cubedispenser")
require("box")
require("physics")
require("firework")
require("flower")
cubedispenserimg = love.graphics.newImage("graphics/SMB/cubedispenser.png")
pushbuttonimg = love.graphics.newImage("graphics/SMB/pushbutton.png")
pushbuttonquad = {love.graphics.newQuad(0, 0, 16, 16, 32, 16), love.graphics.newQuad(16, 0, 16, 16, 32, 16)}
pushbuttontime = 1
cubedispensertime = 1
buttonbaseimg = love.graphics.newImage("graphics/SMB/buttonbase.png")
buttonbuttonimg = love.graphics.newImage("graphics/SMB/buttonbutton.png")
--fireballimg = love.graphics.newImage("graphics/SMB/fireball.png")
flowerimg = love.graphics.newImage("graphics/SMB/flower.png")
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
--fireworkX = 30
--marioscore = 0
--fireworksoundtime = 0
--fireworkdelay = 0
--frame = 0
--fireballquad = {}
--for i = 1, 4 do
--	fireballquad[i] = love.graphics.newQuad((i-1)*8, 0, 8, 8, 80, 16)
--end
flowerX = 245
flowerY = 245
flowerquad = {}
for i = 1, 4 do
	flowerquad[i] = love.graphics.newQuad((i-1)*16, 0, 16, 16, 64, 16)
end
mushroomtime = 0
staranimationdelay = 10

objects = {}
objects["button"] = {}
objects["pushbutton"] = {}
objects["cubedisp"] = {}
objects["box"] = {}
-- objects["firework"] = {} 


custommusic = false


test = {
	load = function()
		push = pushbutton:new(buttonx-2,buttony,"left")
		butt = button:new(buttonx,buttony)
		cubedisp = cubedispenser:new(buttonx, buttony-5,5)
		--fireworks = fireworkboom:new(fireworkX)
		flowy = flower:new(flowerX, flowerY);
		
	end,
	update = function(dt)
		push:update(dt)
		butt:update(dt)
		cubedisp:update(dt)
		--fireworks:update(dt)
		flowy:update(dt)
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
