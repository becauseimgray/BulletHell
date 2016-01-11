require "player"
require "bullets"
require "wavecollision"

function love.load()
	player.LOAD()
	bullet.load()
end

function love.update(dt)
	player.UPDATE(dt)
	bullet.update(dt)
end

function love.draw()
	player.DRAW()
	bullet.draw()
	rectangles.draw()
end
