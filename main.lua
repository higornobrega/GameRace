function love.load()--Cria e atribui as variaveis (setup)
    x = 0
    y = 0
    carro = love.graphics.newImage("imagens/carro.png")
end

function love.update()--Se repere

    --função keyboard.isDown responde enquanto o botão estiver precionado
    --[[if love.keyboard.isDown("left") then
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
    end]]

    function love.keypressed(key)
        if key == "left" then
            x = x - 1
        end

        if key == "right" then
            x = x + 1
        end
        
        if key == "up" then
            y = y - 1
        end
        if key == "down" then
            y = y + 1
        end
    end    
end

function love.draw()-- Desenha
    love.graphics.draw(carro, x,y)
end
