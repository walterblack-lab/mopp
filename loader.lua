-- MATRIX HUB | OFFICIAL LOADER [2026]
-- Replace 'FELHASZNALONEV' with your actual GitHub username!

local success, err = pcall(function()
    print("Matrix Hub loading...")
    
    -- Letöltjük és futtatjuk a Main Scriptet
    -- Fontos: A 'raw' linket használjuk a GitHub-ról!
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FELHASZNALONEV/MatrixHub/main/main.lua"))()
end)

if not success then
    warn("Matrix Hub hiba a betoltesnel: " .. tostring(err))
end
