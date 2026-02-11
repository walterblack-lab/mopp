-- main.lua
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "MATRIX HUB | STREET LIFE",
    LoadingTitle = "Modular Loading...",
    ConfigurationSaving = { Enabled = false }
})

-- Modul betöltése (GitHub linkkel helyettesítsd majd)
local StreetLife = loadstring(game:HttpGet("https://raw.githubusercontent.com/FELHASZNALONEV/MatrixHub/main/modules/StreetLife.lua"))()

local FarmTab = Window:CreateTab("Auto Farm")
local SettingsTab = Window:CreateTab("Settings")

-- FARM TOGGLE
FarmTab:CreateToggle({
    Name = "Auto Mop Puddles",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            StreetLife.StartFarm()
        else
            StreetLife.StopFarm()
        end
    end,
})

-- UNLOAD GOMB
SettingsTab:CreateButton({
    Name = "Destroy Script (Unload)",
    Callback = function()
        StreetLife.StopFarm() -- Minden ciklust leállítunk
        _G.AutoClean = false  -- Globális változók törlése
        Rayfield:Destroy()    -- A teljes UI törlése
        print("Matrix Hub sikeresen eltávolítva.")
    end,
})
