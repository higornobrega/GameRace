function love.load()--Cria e atribui as variaveis (setup)
    x = 0
    y = 0
    carro = love.graphics.newImage("imagens/carro.png")
end

function love.update()--Se repere
    
    if love.keyboard.isDown("left") then
        x = x - 1
    end
    if love.keyboard.isDown("right") then
        x = x + 1
    end
    if love.keyboard.isDown("up") then
        y = y - 1
    end
    if love.keyboard.isDown("down") then
        y = y + 1
    end
    
end

function love.draw()-- Desenha
    love.graphics.draw(carro, x,y)
end
