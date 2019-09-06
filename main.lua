function love.load()--Cria e atribui as variaveis (setup)
   --dados do carro do jogador
    x = 370
    y = 450
    velocidade = 0
    aceleracao = 0
    percorrido = 0
    tempo = 0
    carro = love.graphics.newImage( "imagens/carro.png" )
    --dados do ambiente
    fim_jogo = false
    bg_img = love.graphics.newImage( "imagens/bg.png" )
    faixa_img = love.graphics.newImage( "imagens/faixa.png" )
    normal_font = love.graphics.newFont("imagens/SFDigital.ttf", 32)
    big_font = love.graphics.newFont("imagens/SFDigital.ttf", 150)
    musica = love.audio.newSource("sons/music_bg.mp3", "stream")
    love.audio.play( musica )
    splash = love.audio.newSource("sons/splash.mp3", "static")
    love.graphics.setColor( 200, 10, 10 )
    --dados do obstáculo (poça)
    poca = false --existe poca ou nao?
    poca_posicao = 0 --posicao da poca em relacao ao carro do jogador
    poca_x = 0
    poca_y = 0
    poca_img = love.graphics.newImage( "imagens/poca.png" )
end

function love.update(delta_t)--Se repere
    --delta_t veria de acordo com cada processador para o desempenho ser o mesmo(guarda )
    --função keyboard.isDown responde enquanto o botão estiver precionado
    

    --Velocidade em relação ao ambiente
    if not fim_jogo then --O carro parar quando acabar o te
        if love.keyboard.isDown("left") and x > 250 then -- limitando os lados
            x = x - 200 * delta_t
        end

        if love.keyboard.isDown("right") and x < 490 then
            x = x + 200 * delta_t
        end
        percorrido = percorrido + velocidade * delta_t

        if love.keyboard.isDown( "up" ) then
            -- Quanto maior a velocidade, menor a variação de aceleração
            -- Isso simula a resistência do ar
            aceleracao = 10 * (50 - velocidade)/50
        elseif love.keyboard.isDown( "down" ) then
            aceleracao = -30 -- freia muito: pé no freio
        else
            aceleracao = -5 -- freia pouco: simula inércia
        end
        --Poça
        if poca then -- Se existe ou não poça na tela
            if poca_posicao < percorrido - 5 then -- Se o carro já passou ou não pela poça
                poca = false
            else
                poca_y = 450 - 30 * (poca_posicao - percorrido) -- Atualiza a posição da poça no eixo y
                if x + 55 > poca_x and x < poca_x + 60 and poca_y + 65 > 450 and poca_y < 455 then
                -- Verifica se há colisão e se houver, reduz a aceleração
                    aceleracao = aceleracao - 4*velocidade
                    if velocidade > 5 then
                        love.audio.play( splash )
                    end
                end
            end
        elseif math.random() < 0.1 then
            -- Cria poça em 10% dos casos quando ela não existe
            poca_posicao = percorrido + 30
            poca_x = 100 * math.random( 3 ) + 170
            -- Coloca a poça em uma das três faixas aleatoriamente
            poca = true
        end
        --ajustes da aceleração e velocidade
        aceleracao = aceleracao * delta_t --aumenta a aceleração quando o loop
        --demora mais e diminui quando o loop é mais lento
        velocidade = velocidade + aceleracao
        if velocidade < 0 then
            velocidade = 0  
        end
        -- ajusta o quanto ja percorreu em funcao da velocidade
        percorrido = percorrido + velocidade * delta_t

        if tempo > 60 and not fim_jogo then
            if percorrido > 2000 then
                fim_jogo = "BRAVO !!!"
            else
                fim_jogo = "GAME OVER !!!"
            end
        end
        if not fim_jogo then
            tempo = tempo + delta_t
        else
            aceleracao = -10
        end
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
end

function love.draw()-- Desenha
    --desenha imagem de fundo
    love.graphics.draw(bg_img)--Ordem dos fatores alteram o resultado se inverter o carro fica por baixo do background e não aparece
    --desenha faixas (sensação de velocidade)
    local pos = (percorrido % 4) * 30 - 60 
    for fc=0,5 do
        love.graphics.draw(faixa_img, 345, pos + fc * 120)
    end
    --informa a velocidade, tempo e espaço
    love.graphics.setFont(normal_font)
    love.graphics.print( string.format("%.2f Km/h",velocidade),650,250)
    love.graphics.print( string.format("%.2f s", tempo),650,280)
    love.graphics.print(string.format( "%.2f km",percorrido/1000 ), 650, 310)
    if poca then
        love.graphics.draw( poca_img, poca_x, poca_y )
    end
  
    --desenha carro
    love.graphics.draw(carro, x,y)
    if fim_jogo then
        love.graphics.setColor( 10, 10, 10, 200 )
        love.graphics.setFont( big_font )
        love.graphics.print( fim_jogo, 150, 300)
    end
end
