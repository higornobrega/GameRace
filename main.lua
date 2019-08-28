function love.load()--Cria e atribui as variaveis (setup)
    x = 370
    y = 532
    velocidade = 60
    percorrido = 0
faixa_img = love.graphics.newImage("imagens/faixa.png")
    carro = love.graphics.newImage("imagens/carro.png")
    bg_img = love.graphics.newImage("imagens/bg_teste.png")
end

function love.update(delta_t)--Se repere
    --delta_t veria de acordo com cada processador para o desempenho ser o mesmo(guarda )
    --função keyboard.isDown responde enquanto o botão estiver precionado
    if love.keyboard.isDown("left") and x > 250 then -- limitando os lados
        x = x - 200 * delta_t
    end

    if love.keyboard.isDown("right") and x < 490 then
        x = x + 200 * delta_t
    end
    percorrido = percorrido + velocidade * delta_t
    --[[if love.keyboard.isDown("up") then
        y = y - 10
    end
    if love.keyboard.isDown("down") then
        y = y + 10
    end]]

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
    love.graphics.draw(bg_img)--Ordem dos fatores alteram o resultado se inverter o carro fica por baixo do background e não aparece
    local pos = (percorrido % 4) * 30 - 60 
    for fc=0,5 do
        love.graphics.draw(faixa_img, 345, pos + fc * 120)
    end
    
    love.graphics.draw(carro, x,y)
end
