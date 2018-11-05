local screen = {}

screen.__index = screen;

--Initializer, Required to run properly(?)
function screen.new(pixelSize)
	local self = setmetatable({pixelBuffer = {}}, screen)
	self.pixelBuffer = {}
	self.pixelSize = pixelSize
	self.screenWidth = love.graphics.getWidth()
	self.screenHeight = love.graphics.getHeight()
	
	return self
end

--resize function, you could probably scale the screen properly with this, But I don't so oh well
function screen:resize()
	
end

--[[

	Ah the Draw Functions,
	Draw Fill will draw a rectangle of that width and that height
	Draw Pixel will only draw a singular pixel in that area
		Pixels are based on what size you set them to be

]]--

function screen:drawFill(x, y, w, h, r, g, b, a)
	love.graphics.setColor(r, g, b, a)
	love.graphics.rectangle("fill", x, y, w, h)
end

function screen:drawPixel(x, y, r, g, b, a)
	love.graphics.setColor(r, g, b, a)
	local width = self.pixelSize
	local height = self.pixelSize
	love.graphics.rectangle("fill", x * width, y * height, width, height)
end

function screen:drawImage(x, y, image, r, g, b, a)
	love.graphics.setColor(r, g, b, a)
	
	love.graphics.draw(image, x, y);
end

return screen