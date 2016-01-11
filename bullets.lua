require "player"

window_h = love.graphics.getHeight()

bullet = {}

function bullet.load()

   can_fire = true --If true player can shoot
   fire_wait = 0.1 --Delay between shots in seconds
   fire_tick = 0 --Used to count the seconds

  for i=0,5 do
    bullet.img = love.graphics.newImage("/images/bullet.png")
    bullet.x = player.x
    bullet.y = player.y
    bullet.w = 16
    bullet.h = 16
    bullet.speed = 500
    bullet_state = true
    table.insert(bullet, bullet)
  end
end

function bullet.update(dt)
  if not can_fire then
        fire_tick = fire_tick + dt --Increases fire_tick by dt each frame which resaults in fire_tick increasing by 1 roughly every second
          if fire_tick > fire_wait then
           can_fire = true
           fire_tick = 0
          end
  end

  for i,v in ipairs(bullet) do
        bullet_state = false
        v.y = v.y - bullet.speed * dt
          if v.y > window_h then
            table.remove(bullet, 1)
          end
  end
    if love.keyboard.isDown("z") then
      if can_fire then
        bullet[#bullet + 1] = {
            y     = player.y,
            speed = bullet.speed,
            x     = player.x,
         }
            can_fire = false
      end
    end
end

function bullet.draw()
  if bullet_state == false then
    for i,v in ipairs(bullet) do
    love.graphics.draw(bullet.img,v.x,v.y)
    end
  end
end

return bullet
