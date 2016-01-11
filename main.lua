require "player"
require "bullets"
require "wavecollision"
require "enemy"

function love.load()
	player.LOAD()
	bullet.load()
	enemy.load()
	rectangles.load()
end

function love.update(dt)
	player.UPDATE(dt)
	bullet.update(dt)
	enemy.update(dt)
end

function love.draw()
	player.DRAW()
	bullet.draw()
	rectangles.draw()
	enemy.draw()
end
