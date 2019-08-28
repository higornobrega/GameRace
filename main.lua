function love.load()--Cria e atribui as variaveis (setup)
    x = 100
    y = 100
    carro = love.graphics.newImage("imagens/carro.png")
    love.graphics.setBackgroundColor(255,255,255)
end

function love.update()--Se repere

    --função keyboard.isDown responde enquanto o botão estiver precionado
    if love.keyboard.isDown("left") then
        if x ~= 250 then -- limitando os lados
        x = x - 10
        end
    end
    if love.keyboard.isDown("right") then --limitando os lados
        if x ~= 490 then
        x = x + 10
        end
    end
    if love.keyboard.isDown("up") then
        y = y - 10
    end
    if love.keyboard.isDown("down") then
        y = y + 10
    end

    --Função keypresser não responde enquanto o botão estiver precionado (reponde apenas uma vez por precionado)
    --[[function love.keypressed(key) 
        if key == "left" then
            x = x - 10
        end

        if key == "right" then
            x = x + 10
        end
        
        if key == "up" then
            y = y - 10
        end
        if key == "down" then
            y = y + 10
        end
    end ]]   
end

function love.draw()-- Desenha
    love.graphics.draw(carro, x,y)
end
