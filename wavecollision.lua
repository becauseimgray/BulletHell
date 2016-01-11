lg = love.graphics
rectangles = {}

function rectangles.draw()
  rectangle1 = lg.rectangle("line",0,0,800,100)
  rectangle2 = lg.rectangle("line",0,100,800,100)
  rectangle3 = lg.rectangle("line",0,200,800,100)
  rectangle4 = lg.rectangle("line",0,300,800,100)
end
return rectangles
