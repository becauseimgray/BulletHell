lg = love.graphics
rectangles = {}

function rectangles.load()
  rectangle1 = {}
  rectangle2 = {}
  rectangle3 = {}
  rectangle4 = {}

  rectangle1.x = 0
  rectangle1.y = 0

  rectangle2.x = 0
  rectangle2.y = 100

  rectangle3.x = 0
  rectangle3.y = 200

  rectangle4.x = 0
  rectangle4.y = 300

  rectangle1.w = 800
  rectangle1.h = 100
  rectangle2.w = 800
  rectangle2.h = 100
  rectangle3.w = 800
  rectangle3.h = 100
  rectangle4.w = 800
  rectangle4.h = 100

end

function rectangles.draw()
  lg.rectangle("line",rectangle1.x,rectangle1.y,rectangle1.w,rectangle1.h)
  lg.rectangle("line",rectangle2.x,rectangle2.y,rectangle2.w,rectangle2.h)
  lg.rectangle("line",rectangle3.x,rectangle3.y,rectangle3.w,rectangle3.h)
  lg.rectangle("line",rectangle4.x,rectangle4.y,rectangle4.w,rectangle4.h)
end
return rectangles
