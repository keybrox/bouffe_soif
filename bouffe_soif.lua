
local faim = 100
local soif = 100


function DrawBar(x, y, width, height, percent, color)

    
    DrawRect(x, y, width, height, 0, 0, 0, 150)



    DrawRect(x, y, width * percent, height, color.r, color.g, color.b, 255)
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

 
        DrawBar(0.5, 0.85, 0.6, 0.02, faim / 100, {r = 0, g = 255, b = 0}) 

        DrawBar(0.5, 0.88, 0.6, 0.02, soif / 100, {r = 0, g = 0, b = 255}) 

        SetTextFont(0)
        SetTextScale(0.35, 0.35)
        SetTextColor(255, 255, 255, 255)
        SetTextEntry("STRING")
        AddTextComponentString("Faim: " .. math.floor(faim) .. "%")
        DrawText(0.45, 0.84) 

        SetTextFont(0)
        SetTextScale(0.35, 0.35)
        SetTextColor(255, 255, 255, 255)
        SetTextEntry("STRING")
        AddTextComponentString("Soif: " .. math.floor(soif) .. "%")
        DrawText(0.45, 0.87) 
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000) 

        if faim > 0 then
            faim = faim - 0.5
        end

        if soif > 0 then
            soif = soif - 0.5
        end

        
        if faim <= 0 then
            TriggerEvent("chat:addMessage", { args = { "^1Attention", "Vous avez faim !" } })
        end

        if soif <= 0 then
            TriggerEvent("chat:addMessage", { args = { "^1Attention", "Vous êtes assoiffé !" } })
        end
    end
end)
