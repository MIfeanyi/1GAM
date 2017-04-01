--Will contain fade function

camera = {
  fading = false,
  elaspedTime = 0,
  fadeTime = 0.10,
  alpha = 0,
}

function camera.fadeIn(dt)  
  if camera.fading ==true then
    camera.elaspedTime = camera.elaspedTime + dt

    if camera.elaspedTime > camera.fadeTime then
      camera.alpha = camera.alpha + 51
      camera.elaspedTime = 0
      print("updating")
      print(camera.alpha)
    end
    if camera.alpha > 255 then
      love.graphics.setColor(255, 255, 255, 255)
      camera.fading = false
      return true
    end
  end
  return false
end

function camera.fadeOut(dt)
  if camera.fading == true then
    camera.elaspedTime = camera.elaspedTime + dt
    
    if camera.elaspedTime > camera.fadeTime then
      camera.alpha = camera.alpha - 51
      camera.elaspedTime = 0
      print("updating")
      print(camera.alpha)
    end
    if camera.alpha <= 0 then
      camera.fading = false
      love.graphics.setColor(255, 255, 255, 0)
      return true
    end
    return false
  end
end

function camera.draw()
  if camera.fading == true then
    love.graphics.setColor(255, 255, 255, camera.alpha)
    --print("drawing")
  else 
    --love.graphics.setColor(255, 255, 255, 255)
  end

  if camera.alpha > 255 and camera.fading == true then
    camera.fading = false
    camera.alpha = 255
    print("completed fade in")
  end
  
  if camera.alpha < 0 and camera.fading == true then
    camera.fading = false
    print("completed fade out")
    camera.alpha = 0
  end
  

end
