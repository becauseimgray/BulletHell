require "bullets"
require "wavecollision"

  enemy = {}
function enemy.load(dt)
  enemy.xvel     = 0
  enemy.yvel     = 0
  enemy.friction = .9
  enemy.w        = 32
  enemy.h        = 32
  enemy.x        = window_w - 50
  enemy.y        = -enemy.h
  enemy.speed    = 90 - enemy.friction
  enemy.img      = love.graphics.newImage("images/enemy.png")
  enemy.count    = 0
  enemy.pause    = false
  enemy.done     = false
  wait_time      = 2 --changing this changes how long this enemy waits for before moving past whatever boundary I've set

  initTime       = love.timer.getTime()
end

function enemy.physics(dt)
  local currentTime = love.timer.getTime()
  local timeDelta = math.floor(currentTime - initTime)
  currentNumber = wait_time - timeDelta

  if enemy.y > rectangle2.h then    -- this is the boundary where the enemies will stop, fire bullets, etc.
      enemy.pause = true
      if currentNumber < 0 then
          enemy.pause = false
          enemy.done = true
          --enemy.speed = 180 - enemy.friction
        end
    end

  if enemy.count > 50 and enemy.pause ~= true and enemy.done ~= true then
    enemy.y = enemy.y + (enemy.speed * dt)
  elseif enemy.done then
    enemy.x = enemy.x + (enemy.speed * dt)
  end

  if enemy.y > window_h then
    table.remove(enemy, 1)
  end
end


function enemy.update(dt)

    enemy.count = enemy.count + 1
  	enemy.physics(dt)
end

function enemy.draw()
  love.graphics.draw(enemy.img, enemy.x, enemy.y)
end
return enemy
