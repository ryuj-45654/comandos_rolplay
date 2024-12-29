-- Autor: ryuj-45654
WorkshopID = "3391926656" -- ID del addon en el Workshop

-- Comando !me (Solo jugadores cercanos pueden verlo)
hook.Add("PlayerSay", "ComandoMe", function(ply, text, team)
    if string.sub(text, 1, 4) == "!me " then
        local message = string.sub(text, 5)
        local players = player.GetAll()
        
        for _, player in ipairs(players) do
            if ply:GetPos():Distance(player:GetPos()) < 500 then -- Solo jugadores cerca (500 unidades)
                player:ChatPrint(ply:Nick() .. " " .. message)
            end
        end
        
        return "" -- Evita que el mensaje se muestre en el chat general
    end
end)

-- Comando !do (Solo jugadores cercanos pueden verlo)
hook.Add("PlayerSay", "ComandoDo", function(ply, text, team)
    if string.sub(text, 1, 4) == "!do " then
        local message = string.sub(text, 5)
        local players = player.GetAll()

        for _, player in ipairs(players) do
            if ply:GetPos():Distance(player:GetPos()) < 500 then
                player:ChatPrint("[DO] " .. ply:Nick() .. ": " .. message)
                player:SendLua("chat.AddText(Color(255, 165, 0), '[DO] " .. ply:Nick() .. ": " .. message .. "')")
            end
        end
        
        return ""
    end
end)

-- Comando !looc (Solo jugadores cercanos pueden verlo)
hook.Add("PlayerSay", "ComandoLooc", function(ply, text, team)
    if string.sub(text, 1, 6) == "!looc " then
        local message = string.sub(text, 7)
        local players = player.GetAll()

        for _, player in ipairs(players) do
            if ply:GetPos():Distance(player:GetPos()) < 500 then
                player:ChatPrint("[LOOC] " .. ply:Nick() .. ": " .. message)
            end
        end
        
        return ""
    end
end)

-- Comando !entorno (Visible para todos)
hook.Add("PlayerSay", "ComandoEntorno", function(ply, text, team)
    if string.sub(text, 1, 9) == "!entorno " then
        local message = string.sub(text, 10)
        -- Mensaje global para todos los jugadores
        for _, player in ipairs(player.GetAll()) do
            player:ChatPrint("[ENTORNO] " .. ply:Nick() .. ": " .. message)
        end
        
        return ""
    end
end)

-- Comando !ooc (Visible para todos)
hook.Add("PlayerSay", "ComandoOOC", function(ply, text, team)
    if string.sub(text, 1, 5) == "!ooc " then
        local message = string.sub(text, 6)
        -- Mensaje global para todos los jugadores
        for _, player in ipairs(player.GetAll()) do
            player:ChatPrint("[OOC] " .. ply:Nick() .. ": " .. message)
        end
        
        return ""
    end
end)

-- Comando !roll para generar un número aleatorio entre 0 y 100
hook.Add("PlayerSay", "RollCommand", function(ply, text)
    -- Convertir el texto a minúsculas para evitar problemas con mayúsculas/minúsculas
    text = string.lower(text)

    -- Comprobar si el jugador ha escrito "!roll"
    if text == "!roll" then
        -- Generar un número aleatorio entre 0 y 100
        local rollResult = math.random(0, 100)

        -- Enviar el mensaje a todos los jugadores cercanos (radio configurable)
        local radius = 500 -- Radio en unidades de Hammer (ajustar según necesidad)
        for _, v in ipairs(ents.FindInSphere(ply:GetPos(), radius)) do
            if v:IsPlayer() then
                v:ChatPrint(ply:Nick() .. " ha lanzado un dado: " .. rollResult)
            end
        end

        -- Detener el mensaje para que no se envíe al chat normal
        return ""
    end
end)

-- Comando !ano (Visible para todos, pero anónimo y en color negro)
hook.Add("PlayerSay", "ComandoAno", function(ply, text, team)
    if string.sub(text, 1, 5) == "!ano " then
        local message = string.sub(text, 6)
        -- Mensaje global para todos los jugadores sin mostrar el nombre del jugador
        for _, player in ipairs(player.GetAll()) do
            player:ChatPrint("[ANÓNIMO]: " .. message)
            player:SendLua("chat.AddText(Color(0, 0, 0), '[ANÓNIMO]: " .. message .. "')")
        end
        
        return "" -- Evita que el mensaje se muestre en el chat general
    end
end)

-- Comando !it (Visible para todos en amarillo)
hook.Add("PlayerSay", "ComandoIt", function(ply, text, team)
    if string.sub(text, 1, 4) == "!it " then
        local message = string.sub(text, 5)
        -- Mensaje global para todos los jugadores
        for _, player in ipairs(player.GetAll()) do
            player:ChatPrint("[IT] " .. ply:Nick() .. ": " .. message)
            player:SendLua("chat.AddText(Color(255, 255, 0), '[ANUNCIO] " .. ply:Nick() .. ": " .. message .. "')")
        end
        
        return "" -- Evita que el mensaje se muestre en el chat general
    end
end)