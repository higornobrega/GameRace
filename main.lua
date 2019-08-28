function love.load()
    x = 100
    y = 100
    carro = love.graphics.newImage("imagens/carro.png")
end

function love.draw()
    love.graphics.draw(carro, x,y)
end
