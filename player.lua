window_w = love.graphics.getWidth()
window_h = love.graphics.getHeight()
window_x = 0
window_y = 0

player = {}

--this is where we set atributes of the player
function player.load()
	player.x = 335
	player.y = 550
	player.width = 32
	player.height = 32
	player.xvel = 0
	player.yvel = 0
	player.friction = .9
	player.speed = 2000
	player.img = love.graphics.newImage("images/32x32avatar.png")
end

--this is where the player is drawn from
function player.draw()
	love.graphics.setColor(255,255,255)
	--love.graphics.rectangle("fill",player.x,player.y,player.width,player.height)
	love.graphics.draw(player.img,player.x,player.y)

end

--this is where the phusics are handled
function player.physics(dt)
	player.x = player.x + player.xvel * dt
	player.y = player.y + player.yvel * dt
	player.xvel = player.xvel * (.9 - math.min(dt*player.friction, 1))
	player.yvel = player.yvel * (.9 - math.min(dt*player.friction, 1))
end

function player.collisions()
  if player.x < 0 then player.x = 0
  end
  if player.y < 0 then player.y = 0
  end
  if player.x > love.graphics.getWidth() - player.width then
      player.x = love.graphics.getWidth() - player.width
  end
  if player.y > love.graphics.getHeight() - player.height then
      player.y = love.graphics.getHeight() - player.height
  end
end

--this is where the movement is handled
function player.move(dt)
	if love.keyboard.isDown("right") and
	player.xvel < player.speed then
		player.xvel = player.xvel + player.speed * dt
	end

	if love.keyboard.isDown("left") and
	player.xvel > -player.speed then
		player.xvel = player.xvel - player.speed * dt
	end

	if love.keyboard.isDown("down") and
	player.yvel < player.speed then
		player.yvel = player.yvel + player.speed * dt
	end

	if love.keyboard.isDown("up") and
	player.yvel > -player.speed then
		player.yvel = player.yvel - player.speed * dt
	end

end

--functions are put here to be easily managaed in the main file
function player.LOAD()
	player.load()
end

function player.UPDATE(dt)
	player.physics(dt)
	player.move(dt)
  player.collisions()
end

function player.DRAW()
	player.draw()
end
