--Collision Dection Function

function collisionCheck(rect1X,rect1Y,rect1W,rect1H,rect2X,rect2Y,rect2W,rect2H)
  
  --Checking collision
  if 
    rect1X < rect2X + rect2W and
    rect1X + rect1W > rect2X and
    rect1Y < rect2Y + rect2H and
    rect1Y + rect1H > rect2Y then
    return true
  else
  return false
end

end