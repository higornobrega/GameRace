function love.load()
    x = 0
    y = 0
    carro = love.graphics.newImage("imagens/carro.png")
end

function love.update()
    x = x + 1
    y = y + 1
end

function love.draw()
    love.graphics.draw(carro, x,y)
end
