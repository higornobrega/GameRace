function love.load()
    carro = love.graphics.newImage("imagens/carro.png")
end

function love.draw()
    love.graphics.draw(carro, 300,300)
end
